class UserAdditionalEntity {
  final bool showedPullUp;
  final bool showedOnboarding;
  final bool showLimit;
  final String uid;

  const UserAdditionalEntity({
    required this.showedPullUp,
    required this.showedOnboarding,
    required this.showLimit,
    required this.uid,
  });

  UserAdditionalEntity copyWith({
    bool? showedPullUp,
    bool? showedOnboarding,
    bool? showLimit,
  }) =>
      UserAdditionalEntity(
        showedPullUp: showedPullUp ?? this.showedPullUp,
        showedOnboarding: showedOnboarding ?? this.showedOnboarding,
        showLimit: showLimit ?? this.showLimit,
        uid: uid,
      );
}
