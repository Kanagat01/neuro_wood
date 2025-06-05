const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();
const axios = require("axios").default;
const authService = admin.auth();
const firestore = admin.firestore();
const collectionAuth = "auth_codes";

let config = require("./env.json");
if (Object.keys(functions.config()).length) {
  config = functions.config();
}

const checkUserByPhone = async function(phone) {
  try {
    const userRecord = await authService.getUserByPhoneNumber(phone);
    return userRecord.uid;
  } catch (error) {
    return null;
  }
};

const createUser = async function(phone) {
  try {
    const userRecord = await authService.createUser({
      phoneNumber: phone,
    });
    return userRecord.uid;
  } catch (error) {
    functions.logger.error("Failed to create user", {
      "phone": phone,
      "error": error,
    });
    return null;
  }
};

const generateCode = function() {
  let result = "";
  const words = "0123456789";
  const maxPosition = words.length - 1;
  for (let i = 0; i < 6; ++i) {
    const position = Math.floor(Math.random() * maxPosition);
    result = result + words.substring(position, position + 1);
  }
  return result;
};

const sendSmsCode = async function(phone, code) {
  const p = phone.replace(/[^0-9]/g, "");
  const smsAeroEmail = config.service.sms_aero_email;
  const smsAeroApiKey = config.service.sms_aero_api_key;
  const smsAeroSign = config.service.sms_aero_sign;
  const req = `https://${smsAeroEmail}:${smsAeroApiKey}@gate.smsaero.ru/v2/sms/send?=&number=${p}&text=${code}&sign=${smsAeroSign}`;
  try {
    const response = await axios.get(req);
    if (response.data["success"]) {
      return true;
    }
    functions.logger.error("Failed to send sms", {
      "phone": phone,
      "code": code,
      "request": req,
      "response.data": response.data,
    });
    return false;
  } catch (error) {
    functions.logger.error("Failed to send sms request", {
      "phone": phone,
      "code": code,
      "request": req,
      "error": error,
    });
    return false;
  }
};

const addRecordSendCode = async function(uid, data) {
  const docRef = firestore.collection(collectionAuth).doc(uid);
  try {
    await firestore.runTransaction(async (d) => {
      const doc = await d.get(docRef);
      const docData = doc.data();
      Object.assign(docData, data);
      d.set(docRef, docData, {
        merge: true,
      });
    });
    return true;
  } catch (error) {
    functions.logger.error("Failed to add submission code record", {
      "uid": uid,
      "data": data,
      "error": error,
    });
    return false;
  }
};

const addRecordItemSendCode = async function(uid, data) {
  const docRef = firestore.collection(collectionAuth).doc(uid);
  try {
    await firestore.runTransaction(async (d) => {
      const doc = await d.get(docRef);
      const obj = doc.get("codes") ? doc.get("codes") : {};
      Object.assign(obj, data);
      d.set(docRef, {codes: obj}, {
        merge: true,
      });
    });
    return true;
  } catch (error) {
    functions.logger.error("Failed to add submission code item record", {
      "uid": uid,
      "data": data,
      "error": error,
    });
    return false;
  }
};

const getRecordSendCode = async function(uid, ignore = false) {
  try {
    const doc = await firestore.collection(collectionAuth).doc(uid).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  } catch (error) {
    if (!ignore) {
      functions.logger.error("Failed to get submission code record", {
        "uid": uid,
        "error": error,
      });
    }
    return null;
  }
};

const createToken = async function(uid) {
  try {
    const customToken = await authService.createCustomToken(uid);
    return customToken;
  } catch (error) {
    functions.logger.error("Failed to create token", {
      "uid": uid,
      "error": error,
    });
    return null;
  }
};

exports.verifyPhone = functions.https.onCall(async (data, context) => {
  const phone = data.phone;

  let uid = await checkUserByPhone(phone);
  if (uid == null) {
    uid = await createUser(phone);
  }
  if (uid == null) {
    return {"code": "failed-create-user"};
  }
  const nowDate = Date.now();
  const docGetted = await getRecordSendCode(uid, true);
  let countInHour = 0;
  let lastSms;
  if (docGetted != null) {
    if (docGetted["blocked_until"] != null) {
      if (nowDate < docGetted["blocked_until"]) {
        return {
          "code": "blocked-1-h",
          "uid": uid,
        };
      }
    }
    const keys = docGetted["codes"] ? Object.keys(docGetted["codes"]) : [];
    if (keys.length >= 2) {
      keys.forEach((key) => {
        const timeDiff = Math.abs(nowDate - key);
        const diffMin = Math.ceil(timeDiff / (1000 * 60));
        if (diffMin < 60) {
          countInHour++;
        }
        if (lastSms > key) {
          lastSms = key;
        }
      });
      if (countInHour >= 3) {
        addRecordSendCode(uid, {
          "blocked_until": nowDate + (60 * 1000),
        });
        return {
          "code": "blocked-1-h",
          "uid": uid,
        };
      }
    }
    const timeDiff = Math.abs(nowDate - lastSms);
    const diffSec = Math.ceil(timeDiff / (1000));
    if (diffSec < 60) {
      return {
        "code": "timeout",
        "uid": uid,
      };
    }
  }
  const code = generateCode();
  const keyCodes = nowDate.toString();
  const doc = {
    [keyCodes]: {
      "code": code,
      "used": false,
    },
  };
  const res = await addRecordItemSendCode(uid, doc);
  if (!res) {
    return {
      "code": "failed-save-code",
      "uid": uid,
    };
  }
  const resultSend = await sendSmsCode(phone, code);
  if (resultSend) {
    return {"uid": uid};
  } else {
    return {
      "code": "failed-send-sms",
      "uid": uid,
    };
  }
});

exports.verifyCode = functions.https.onCall(async (data, context) => {
  const uid = data.uid;
  const code = data.code;
  const doc = await getRecordSendCode(uid);
  if (doc == null) {
    functions.logger.info("doc not found", {
      "doc_id": uid,
    });
    return {"code": "could-not-find-record"};
  }
  if (!doc["codes"]) {
    return {"code": "could-not-find-record"};
  }
  const dates = Object.keys(doc["codes"]);
  dates.sort(function(a, b) {
    return a - b;
  });
  const lastDateKey = dates[dates.length - 1];
  const lastDate = parseInt(lastDateKey);

  const now = Date.now();
  const timeDiff = Math.abs(now - lastDate);
  const diffMin = Math.ceil(timeDiff / (1000 * 60));
  if (diffMin > 60) {
    functions.logger.info("code expired", {
      "uid": uid,
      "diffMin": diffMin,
    });
    return {"code": "code-expired"};
  }
  const docItem = doc["codes"][lastDateKey];
  const savedCode = docItem["code"];
  if (code != savedCode) {
    functions.logger.info("Incorrect code", {
      "uid": uid,
      "codeInput": code,
      "code": savedCode,
    });
    return {"code": "code-incorrect"};
  } else if (code == savedCode && docItem["used"]) {
    functions.logger.info("Code has been used", {
      "uid": uid,
      "codeInput": code,
      "code": savedCode,
    });
    return {"code": "code-expired"};
  }

  const token = await createToken(uid);
  if (token) {
    docItem["used"] = true;
    const newDoc = {
      [lastDateKey]: docItem,
    };
    await addRecordItemSendCode(uid, newDoc);
    return {"token": token};
  } else {
    return {"code": "failed-create-token"};
  }
});
