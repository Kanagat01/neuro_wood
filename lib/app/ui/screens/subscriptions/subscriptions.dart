import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/domain/entities/launch_action.dart';
import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';
import 'package:neuro_wood/app/ui/widgets/leading_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cubit/subscribtions_cubit.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  ValueNotifier<int> current = ValueNotifier(1);
  _launch(Uri uri) async {
    launchUrl(uri);
  }

  void _showMenu(BuildContext context) {
    Dialogs.showMenu(
      context: context,
      showCancelButtonIos: true,
      title: "salesService".tr(),
      actions: _actionsMenu
          .map(
            (e) => DialogAction(
              title: e.title,
              onPressed: () {
                _launch(e.uri);
                Navigator.of(context).pop();
              },
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<SubscribtionsCubit>()..load();
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text("subscriptionOptions".tr()),
        leading: const LeadingButton(),
      ),
      body: BlocBuilder<SubscribtionsCubit, SubscribtionsState>(
        bloc: cubit,
        builder: (context, state) {
          switch (state) {
            case SubscribtionsInitial():
              return const SizedBox();
            case SubscribtionsLoading():
              return const Center(child: CircularProgressIndicator());
            case SubscribtionsLoaded():
              // return ListView.separated(
              //   primary: true,
              //   padding: const EdgeInsets.all(16),
              //   itemBuilder: (context, index) => TariffItem(
              //     onPressed: (tariff) => _showMenu(context, tariff),
              //     tariff: tariffs[index],
              //   ),
              //   separatorBuilder: (_, __) => const SizedBox(
              //     height: 16,
              //   ),
              //   itemCount: tariffs.length,
              // );
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarouselSlider(
                    items: state.tariffs
                        .map((e) => TariffItem(tariff: e))
                        .toList(),
                    options: CarouselOptions(
                      initialPage: 1,
                      height: 350,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (int v, _) {
                        current.value = v;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ValueListenableBuilder(
                      valueListenable: current,
                      builder: (_, i, __) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          state.tariffs.length,
                          (index) => Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == i
                                  ? NeuroWoodColors.darkGray
                                  : NeuroWoodColors.gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      MediaQuery.of(context).viewPadding.bottom + 16,
                    ),
                    child: PrimaryButton(
                      text: "buyTariffButton".tr(),
                      primaryColor: NeuroWoodColors.green,
                      onPressed: () => _showMenu(context),
                    ),
                  ),
                ],
              );
            case SubscribtionsError():
              return Center(child: Text("thereWasAnErrorTitle".tr()));
            default:
              return Center(child: Text("thereWasAnErrorTitle".tr()));
          }
        },
      ),
    );
  }
}

class TariffItem extends StatelessWidget {
  final TariffEntity tariff;
  const TariffItem({super.key, required this.tariff});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      decoration: BoxDecoration(
        color: NeuroWoodColors.lightGray,
        borderRadius: BorderRadius.circular(16),
        gradient: tariff.primary
            ? const LinearGradient(
                colors: [Color(0xFFDDFBF2), Color(0xFFD4E5FE)],
                stops: [0, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tariff.name,
                style: Theme.of(context).textTheme.displayLarge,
                // textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text(
                    tariff.price,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    tariff.perYear,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          if (tariff.tag?.isNotEmpty ?? false)
            Text(
              tariff.tag!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 12),
          if (tariff.prevTarif != null)
            Text(
              "«${tariff.prevTarif}» +",
              style: Theme.of(context).textTheme.displayMedium,
              // textAlign: TextAlign.center,
            ),
          FeatureRow(feature: tariff.woodCount, hasFeature: true),
          ...tariff.fetures.map(
            (e) => FeatureRow(feature: e.feature, hasFeature: e.hasFeature),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

final List<LaunchAction> _actionsMenu = [
  LaunchAction(
    // uri: Uri.parse('https://t.me/+79804480161'),
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
    title: "+7(980)448-01-61",
  ),
  LaunchAction(
    uri: Uri(scheme: 'mailto', path: 'sales@neuro-wood.com'),
    title: "Email",
  ),
];

class FeatureRow extends StatelessWidget {
  final String feature;
  final bool hasFeature;
  const FeatureRow({
    super.key,
    required this.feature,
    required this.hasFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: NeuroWoodColors.gray),
            ),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: hasFeature
                    ? NeuroWoodColors.green
                    : NeuroWoodColors.gray,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              feature,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: hasFeature
                    ? NeuroWoodColors.black
                    : NeuroWoodColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
