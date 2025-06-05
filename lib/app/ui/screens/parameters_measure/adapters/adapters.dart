import 'package:neuro_wood/app/domain/entities/parameters_measure/location_entity.dart';
import 'package:neuro_wood/app/domain/entities/parameters_measure/sortiment_entity.dart';
import 'package:neuro_wood/app/domain/entities/parameters_measure/bread_entity.dart';
import 'package:neuro_wood/app/domain/entities/parameters_measure/vehicle_type_entity.dart';

import '../widgets/input_select.dart';

class InputSelectAdapterLocation implements InputSelectAdapter<LocationEntity> {
  const InputSelectAdapterLocation(this.value);
  @override
  final LocationEntity value;

  @override
  bool get canSelect => true;

  @override
  String get title => value.name;
}

class InputSelectAdapterSortiment implements InputSelectAdapter<SortimentEntity> {
  const InputSelectAdapterSortiment(this.value);
  @override
  final SortimentEntity value;

  @override
  bool get canSelect => true;

  @override
  String get title => value.name;
}

class InputSelectAdapterBread implements InputSelectAdapter<BreadEntity> {
  const InputSelectAdapterBread(this.value);
  @override
  final BreadEntity value;

  @override
  bool get canSelect => value.state;

  @override
  String get title => value.name;
}

class InputSelectAdapterVehicleType implements InputSelectAdapter<VehicleTypeEntity?> {
  const InputSelectAdapterVehicleType(this.value);
  @override
  final VehicleTypeEntity? value;

  @override
  bool get canSelect => true;

  @override
  String get title => value?.name ?? "";
}
