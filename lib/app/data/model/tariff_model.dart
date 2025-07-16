import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';

class TariffModelsBuilder {
  List<TariffEntity> build({
    required List<String> features,
    required List<Map<String, dynamic>> data,
  }) {
    FetureItemBuilder fib = FetureItemBuilder(features);
    final List<TariffEntity> output = [];
    for (var i = 0; i < data.length; i++) {
      final e = data[i];
      final bool extendPrev = e['extendPrev'];
      output.add(
        TariffEntity(
            fetures: fib.build(List<int>.from(e['fetures']), extendPrev),
            name: e['name'],
            perYear: e['perYear'],
            price: e['price'],
            primary: e['primary'] ?? false,
            woodCount: e['woodCount'],
            prevTarif: extendPrev
                ? output.isNotEmpty
                    ? output.last.name
                    : null
                : null,
            tag: e['tag']),
      );
    }
    return output;
  }
}

class FetureItemBuilder {
  final List<String> features;
  FetureItemBuilder(this.features);
  final Set<int> _prevSelected = {};

  build(List<int> selected, bool extendPrev) {
    List<TariffFeatureItem> list = [];
    for (int i = 0; i < features.length; i++) {
      if (!extendPrev) {
        if (selected.contains(i)) {
          if (!_prevSelected.contains(i)) {
            _prevSelected.add(i);
          }
          list.add(TariffFeatureItem(
            feature: features[i],
            hasFeature: true,
          ));
        }
      } else {
        if (selected.contains(i) && !_prevSelected.contains(i)) {
          _prevSelected.add(i);
          list.add(TariffFeatureItem(
            feature: features[i],
            hasFeature: true,
          ));
        }
      }
    }
    return list;
  }
}
