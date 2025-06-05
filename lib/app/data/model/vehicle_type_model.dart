import 'package:neuro_wood/app/domain/entities/parameters_measure/vehicle_type_entity.dart';

class VehicleTypeModel extends VehicleTypeEntity {
  const VehicleTypeModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory VehicleTypeModel.fromMap(Map<String, dynamic> map) => VehicleTypeModel(
        id: map['id'],
        name: map['name'],
      );

  @override
  List<Object?> get props => [id, name];
}
