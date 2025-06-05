import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class ProfileButtonsBlock extends StatelessWidget {
  const ProfileButtonsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: NeuroWoodColors.lightGray,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // ProfileButton(
          //   title: "subscriptionOptions".tr(),
          //   onPressed: () {
          //     context.router.push(const Subscriptions());
          //   },
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          ProfileButton(
            title: "termsOfUse".tr(),
            onPressed: () {
              context.router.push(
                PDFReaderScreen(
                  pdfPath: 'assets/docs/user_agreement_terms.pdf',
                ),
              );
            },
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // ProfileButton(
          //   title: "privacyPolicy".tr(),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ProfileButton({Key? key, required this.onPressed, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Icon(
                NeuroWoodIcons.arrow_right,
                color: NeuroWoodColors.black,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
