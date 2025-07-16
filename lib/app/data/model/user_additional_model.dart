import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';

class UserAdditionalModel extends UserAdditionalEntity {
  const UserAdditionalModel({
    super.showedPullUp = false,
    super.showedOnboarding = false,
    super.showLimit = false,
    required super.uid,
  });

  factory UserAdditionalModel.fromEntity(UserAdditionalEntity entity) =>
      UserAdditionalModel(
        uid: entity.uid,
        showedPullUp: entity.showedPullUp,
        showLimit: entity.showLimit,
        showedOnboarding: entity.showedOnboarding,
      );

  factory UserAdditionalModel.fromFirebase({
    required Map<String, dynamic> map,
  }) {
    return UserAdditionalModel(
      uid: map['uid'],
      showedPullUp: map['showedPullUp'] ?? false,
      showLimit: map['showLimit'] ?? false,
      showedOnboarding: map['showedOnboarding'] ?? false,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'showedPullUp': showedPullUp,
      'showedOnboarding': showedOnboarding,
      'showLimit': showLimit,
      'uid': uid,
    };
  }
}
