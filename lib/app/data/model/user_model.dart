import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';

import 'subscription_business/subscription_business.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.phone,
    required super.workPhone,
    required super.company,
    required super.recognitionsCount,
    required super.recognitionsVolume,
    required UserAdditionalModel super.additional,
    required SubscriptionModel super.subscription,
  });

  factory UserModel.fromEntity(UserEntity user) => UserModel(
    uid: user.uid,
    name: user.name,
    email: user.email,
    phone: user.phone,
    workPhone: user.workPhone,
    company: user.company,
    recognitionsCount: user.recognitionsCount,
    recognitionsVolume: user.recognitionsVolume,
    additional: UserAdditionalModel.fromEntity(user.additional),
    subscription: SubscriptionModel.fromEntity(user.subscription),
  );

  factory UserModel.fromFirebase({
    required Map<String, dynamic> userMap,
    required User user,
    required Map<int, SubscriptionBusiness> recognitionAvailable,
  }) {
    return UserModel(
      name: userMap['name'],
      email: userMap['email'],
      phone: user.phoneNumber!,
      workPhone: userMap['workPhone'],
      company: userMap['company'],
      recognitionsCount: userMap['recognitionsCount'],
      recognitionsVolume: userMap['recognitionsVolume'],
      uid: user.uid,
      additional: UserAdditionalModel.fromFirebase(map: userMap['additional']),
      subscription: SubscriptionModel.fromFirebase(
        map: userMap['subscription'],
        recognitionAvailable: recognitionAvailable,
      ),
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "workPhone": workPhone,
      "recognitionsCount": recognitionsCount,
      "recognitionsVolume": recognitionsVolume,
      "company": company,
      "subscription": SubscriptionModel.fromEntity(subscription).toDoc(),
    };
  }

  Map<String, dynamic> toUpdateMeasurements() {
    return {
      "recognitionsCount": recognitionsCount,
      "recognitionsVolume": recognitionsVolume,
      "subscription": SubscriptionModel.fromEntity(subscription).toDoc(),
    };
  }

  Map<String, dynamic> toUpdateUserData() {
    return {
      "name": name,
      "email": email,
      "workPhone": workPhone,
      "company": company,
    };
  }
}

class SubscriptionModel extends SubscriptionEntity {
  SubscriptionModel({
    required super.recognitionLeft,
    required super.recognitionAvailable,
    required super.tariff,
    super.start,
    super.end,
    required super.isFree,
  });

  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) =>
      SubscriptionModel(
        recognitionLeft: entity.recognitionLeft,
        recognitionAvailable: entity.recognitionAvailable,
        tariff: entity.tariff,
        start: entity.start,
        end: entity.end,
        isFree: entity.isFree,
      );

  factory SubscriptionModel.fromFirebase({
    required Map<String, dynamic> map,
    required Map<int, SubscriptionBusiness> recognitionAvailable,
  }) {
    final currentTarif = recognitionAvailable[map['tariff']];
    final available = currentTarif?.numMeasurements ?? 0;
    final free = currentTarif?.isDefault ?? true;
    return SubscriptionModel(
      recognitionLeft: map['recognitionsLeft'],
      tariff: map['tariff'],
      start: map['start'] != null && map['start'] is Timestamp
          ? (map['start'] as Timestamp).toDate()
          : null,
      end: map['end'] != null && map['end'] is Timestamp
          ? (map['end'] as Timestamp).toDate()
          : null,
      recognitionAvailable: available,
      isFree: free,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      "recognitionsLeft": recognitionLeft,
      "tariff": tariff,
      "start": start,
      "end": end,
    };
  }
}
