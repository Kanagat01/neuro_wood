class TariffEntity {
  final String name;
  final String woodCount;
  final List<TariffFeatureItem> fetures;
  final String price;
  final String perYear;
  final bool primary;
  final String? prevTarif;
  final String? tag;

  TariffEntity({
    required this.name,
    required this.woodCount,
    required this.fetures,
    required this.price,
    required this.perYear,
    required this.primary,
    this.prevTarif,
    this.tag,
  });
}

class TariffFeatureItem {
  final String feature;
  final bool hasFeature;

  TariffFeatureItem({
    required this.feature,
    required this.hasFeature,
  });
}
