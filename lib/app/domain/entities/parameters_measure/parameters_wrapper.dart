import 'package:neuro_wood/app/domain/entities/parameters_measure/vehicle_type_entity.dart';

import 'location_entity.dart';
import 'sortiment_entity.dart';
import 'bread_entity.dart';

class ParametersWrapper {
  final List<LocationEntity> locations;
  final List<SortimentEntity> sortiment;
  final List<BreadEntity> breads;
  final List<VehicleTypeEntity> vehicleTypes;
  final String? baseUrl;

  ParametersWrapper({
    required this.locations,
    required this.sortiment,
    required this.breads,
    required this.vehicleTypes,
    this.baseUrl,
  });
}
