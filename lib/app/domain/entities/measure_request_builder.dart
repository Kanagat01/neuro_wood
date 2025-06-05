import 'dart:async';

// import 'package:camera/camera.dart' show XFile;
import 'package:neuro_wood/app/domain/entities/parameters_measure/vehicle_type_entity.dart';

import 'measure_request.dart';
import 'measure_type.dart';
import 'parameters_measure/location_entity.dart';
import 'parameters_measure/sortiment_entity.dart';
import 'parameters_measure/bread_entity.dart';

class MeasureRequestBuilder {
  LocationEntity? location;
  SortimentEntity? timberType;
  List<BreadEntity>? treeSpecies;
  VehicleTypeEntity? vehicleType;
  int? length;
  // XFile? image;
  // String? baseUrl;
  String? provider;
  String? carNumber;

  Future<MeasureRequest> build(MeasureType type) async {
    if (_checkNull()) {
      throw Exception();
    }

    return Future.value(MeasureRequest(
      location: location!,
      timberType: timberType!,
      treeSpecies: treeSpecies!,
      length: length!,
      carNumber: carNumber!,
      vehicleType: vehicleType,
      // image: image!,
      // baseUrl: baseUrl,
      provider: provider!,
      type: type,
    ));
  }

  bool _checkNull() {
    return location == null ||
        timberType == null ||
        treeSpecies == null ||
        length == null ||
        provider == null ||
        carNumber == null;
  }
}
