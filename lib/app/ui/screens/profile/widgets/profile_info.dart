import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class ProfileInfo extends StatelessWidget {
  final UserEntity user;
  final VoidCallback changeButtonOnPressed;
  const ProfileInfo({
    super.key,
    required this.user,
    required this.changeButtonOnPressed,
  });

  String formatPhone(String s) => s.replaceAllMapped(
    RegExp(r'(\+7)(\d{3})(\d{3})(\d{2})(\d{2})'),
    (Match m) => "${m[2]} ${m[3]} ${m[4]} ${m[5]}",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 8, 24),
      decoration: BoxDecoration(
        color: NeuroWoodColors.lightGray,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "myProfileData".tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: changeButtonOnPressed,
                  icon: const Icon(NeuroWoodIcons.edit),
                  iconSize: 16,
                  color: NeuroWoodColors.green,
                  splashRadius: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(user.name, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Text(user.company, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                const TextSpan(
                  text: '+7   ',
                  style: TextStyle(color: NeuroWoodColors.darkGray),
                ),
                TextSpan(text: formatPhone(user.workPhone)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(user.email, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
