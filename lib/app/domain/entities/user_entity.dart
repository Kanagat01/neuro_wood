import 'user_additional_entity.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String workPhone;
  final String company;
  final int recognitionsCount;
  final double recognitionsVolume;
  final UserAdditionalEntity additional;
  final SubscriptionEntity subscription;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.workPhone,
    required this.company,
    required this.recognitionsCount,
    required this.recognitionsVolume,
    UserAdditionalEntity? additional,
    required this.subscription,
  }) : additional = additional ??
            UserAdditionalEntity(
              uid: uid,
              showLimit: false,
              showedPullUp: false,
              showedOnboarding: false,
            );

  UserEntity copyWith({
    String? name,
    String? email,
    String? phone,
    String? workPhone,
    String? company,
    int? recognitionsCount,
    double? recognitionsVolume,
    UserAdditionalEntity? additional,
    SubscriptionEntity? subscription,
  }) =>
      UserEntity(
        uid: uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        workPhone: workPhone ?? this.workPhone,
        company: company ?? this.company,
        recognitionsCount: recognitionsCount ?? this.recognitionsCount,
        recognitionsVolume: recognitionsVolume ?? this.recognitionsVolume,
        additional: additional ?? this.additional,
        subscription: subscription ?? this.subscription,
      );
}

class SubscriptionEntity {
  final DateTime? start;
  final DateTime? end;
  final int recognitionLeft;
  final int recognitionAvailable;
  final int tariff;
  final bool isFree;

  SubscriptionEntity({
    this.start,
    this.end,
    required this.recognitionLeft,
    required this.recognitionAvailable,
    required this.tariff,
    required this.isFree,
  });

  factory SubscriptionEntity.initial() => SubscriptionEntity(
        start: null,
        end: null,
        tariff: 0,
        recognitionLeft: 0,
        recognitionAvailable: 0,
        isFree: true,
      );

  SubscriptionEntity copyWith({
    DateTime? start,
    DateTime? end,
    int? recognitionLeft,
    int? tariff,
    bool? isFree,
  }) =>
      SubscriptionEntity(
        start: start ?? this.start,
        end: end ?? this.end,
        recognitionLeft: recognitionLeft ?? this.recognitionLeft,
        tariff: tariff ?? this.tariff,
        recognitionAvailable: tariff ?? this.tariff,
        isFree: isFree ?? this.isFree,
      );
  /*
   "creationTime": currentUser.metadata.creationTime,
        "recognitionsCount": 0,
        "recognitionsVolume": 0,
        "subscription": <String, dynamic>{
          "start": null,
          "end": null,
          "recognitionLeft": 10,
          "tariff": 1,
        },
  */
}
