import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/domain/entities/launch_action.dart';

class Dialogs {
  ///example:
  ///```dart
  ///Dialogs.showDialogMessage(
  ///  title: 'Произошла ошибка',
  ///  text: 'Номер автомобиля не распознан. Попробуйте повторить снова.',
  ///  context: context,
  ///  actions: [
  ///    DialogAction(
  ///      title: 'Повторить',
  ///      isDefaultAction: true,
  ///      onPressed: () {
  ///        Navigator.of(context).pop();
  ///      },
  ///    ),
  ///    DialogAction(
  ///      title: 'Отмена',
  ///      isDestructiveAction: true,
  ///      onPressed: () {
  ///        Navigator.of(context).pop();
  ///      },
  ///    ),
  ///  ],
  ///);
  ///```
  static Future<dynamic> showDialogMessage({
    String? title,
    String? text,
    required BuildContext context,
    List<BaseDialogAction>? actions,
    bool disableBackButton = false,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (ctx) => _DialogBody(title: title, text: text, actions: actions),
      // builder: (ctx) => disableBackButton
      //     ? PopScope(
      //         canPop: false,
      //         child: _DialogBody(
      //           title: title,
      //           text: text,
      //           actions: actions,
      //         ),
      //       )
      //     : _DialogBody(
      //         title: title,
      //         text: text,
      //         actions: actions,
      //       ),
    );
  }

  static showMenu({
    String? title,
    String? text,
    required BuildContext context,
    List<BaseDialogAction>? actions,
    bool showCancelButtonIos = true,
  }) {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        barrierColor: Colors.black.withValues(alpha: 0.5),
        builder: (BuildContext context) => CupertinoActionSheet(
          cancelButton: showCancelButtonIos
              ? CupertinoActionSheetAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancelButton".tr()),
                )
              : null,
          title: title != null ? Text(title) : null,
          message: text != null ? Text(text) : null,
          actions:
              actions
                  ?.map(
                    (e) => CupertinoActionSheetAction(
                      onPressed: e is DialogAction
                          ? e.onPressed
                          : () => (e as DialogActionWithContext).onPressed(
                              context,
                            ),
                      isDestructiveAction: e.isDestructiveAction,
                      isDefaultAction: e.isDefaultAction,
                      child: Text(e.title),
                    ),
                  )
                  .toList() ??
              [],
        ),
      );
    } else {
      final buttonTextStyle = TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Colors.black.withValues(alpha: .5),
        fontSize: 14,
        height: 1.71,
      );
      showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withValues(alpha: .5),
        builder: (context) {
          return Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (title != null || text != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                height: 1.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          if (text != null)
                            Text(
                              text,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                height: 1.43,
                                color: Colors.black.withValues(alpha: .6),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, thickness: 1),
                  ],
                  ...actions
                          ?.map(
                            (e) => TextButton(
                              style: ButtonStyle(
                                padding:
                                    WidgetStateProperty.resolveWith<
                                      EdgeInsetsGeometry
                                    >(
                                      (_) => const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                    ),
                                overlayColor: WidgetStateProperty.resolveWith((
                                  state,
                                ) {
                                  if (state.contains(WidgetState.pressed)) {
                                    return const Color(
                                      0xFFBB86FC,
                                    ).withValues(alpha: .12);
                                  }
                                  return Colors.black.withValues(alpha: .6);
                                }),
                                foregroundColor:
                                    WidgetStateProperty.resolveWith((state) {
                                      if (state.contains(WidgetState.pressed)) {
                                        return const Color(0xFF6200EE);
                                      }
                                      return Colors.black.withValues(alpha: .6);
                                    }),
                                textStyle:
                                    WidgetStateProperty.resolveWith<TextStyle>((
                                      state,
                                    ) {
                                      return buttonTextStyle;
                                    }),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: e is DialogAction
                                  ? e.onPressed
                                  : () => (e as DialogActionWithContext)
                                        .onPressed(context),
                              child: Text(e.title),
                            ),
                          )
                          .toList() ??
                      [],
                ],
              ),
            ],
          );
        },
      );
    }
  }
}

class _DialogBody extends StatelessWidget {
  final String? title;
  final String? text;
  final List<BaseDialogAction>? actions;
  const _DialogBody({this.title, this.text, required this.actions});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title!) : null,
        content: text != null ? Text(text!) : null,
        actions:
            actions
                ?.map(
                  (e) => CupertinoDialogAction(
                    onPressed: e is DialogAction
                        ? e.onPressed
                        : () =>
                              (e as DialogActionWithContext).onPressed(context),
                    isDestructiveAction: e.isDestructiveAction,
                    isDefaultAction: e.isDefaultAction,
                    child: Text(e.title),
                  ),
                )
                .toList() ??
            [],
      );
    } else {
      return AlertDialog(
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )
            : null,
        content: text != null
            ? Text(
                text!,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  height: 1.43,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withValues(alpha: .6),
                ),
              )
            : null,
        actions:
            actions
                ?.map(
                  (e) => TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF6200EE),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        letterSpacing: 1.25,
                      ),
                    ),
                    onPressed: e is DialogAction
                        ? e.onPressed
                        : () =>
                              (e as DialogActionWithContext).onPressed(context),
                    child: Text(e.title.toUpperCase()),
                  ),
                )
                .toList() ??
            [],
      );
    }
  }
}

abstract class BaseDialogAction {
  String get title;
  bool get isDestructiveAction;
  bool get isDefaultAction;
}

class DialogAction extends BaseDialogAction {
  @override
  final String title;
  final VoidCallback onPressed;
  @override
  final bool isDestructiveAction;
  @override
  final bool isDefaultAction;

  DialogAction({
    required this.title,
    required this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });
}

class DialogActionWithContext extends BaseDialogAction {
  @override
  final String title;
  final Function(BuildContext) onPressed;
  @override
  final bool isDestructiveAction;
  @override
  final bool isDefaultAction;

  DialogActionWithContext({
    required this.title,
    required this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });
}

final List<LaunchAction> actionsMenu = [
  LaunchAction(
    uri: Uri.parse('tg://resolve?domain=+79804480161'),
    title: "Telegram",
    fallback: (context) {
      Dialogs.showDialogMessage(
        title: "Не удалось открыть Telegram",
        context: context,
        actions: [
          DialogAction(
            title: "okButton".tr(),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  ),
  LaunchAction(
    uri: Uri.parse("whatsapp://send?phone=79804480161"),
    title: "WhatsApp",
    fallback: (context) {
      Dialogs.showDialogMessage(
        title: "Не удалось открыть WhatsApp",
        context: context,
        actions: [
          DialogAction(
            title: "okButton".tr(),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  ),
  LaunchAction(
    uri: Uri(scheme: 'tel', path: '+79804480161'),
    title: "+7(980)448–01–61",
  ),
  LaunchAction(
    uri: Uri(scheme: 'mailto', path: 'app@neuro-wood.com'),
    title: "Email",
  ),
  // LaunchAction(
  //   uri: Uri(scheme: 'tel', path: '+74951326058'),
  //   title: "+7(495)132-60-58",
  // ),
  // _LaunchAction(
  //   uri: Uri.parse('tg://resolve?domain=toncoin_rus'),
  //   title: "Telegram",
  //   fallback: () {
  //     StoreRedirect.redirect(
  //       androidAppId: "org.telegram.messenger",
  //       iOSAppId: "686449807",
  //     );
  //   },
  // ),
  // _LaunchAction(
  //   uri: Uri.parse("whatsapp://send?phone=79991154210"),
  //   title: "WhatsApp",
  //   fallback: () {
  //     StoreRedirect.redirect(
  //       androidAppId: "com.whatsapp",
  //       iOSAppId: "310633997",
  //     );
  //   },
  // ),
  // _LaunchAction(
  //   uri: Uri.parse("viber://chat?number=%2B79194921747"),
  //   title: "Viber",
  //   fallback: () {
  //     StoreRedirect.redirect(
  //       androidAppId: "com.viber.voip",
  //       iOSAppId: "382617920",
  //     );
  //   },
  // ),
];
