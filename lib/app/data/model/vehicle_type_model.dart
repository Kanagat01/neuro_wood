import 'package:neuro_wood/app/domain/entities/parameters_measure/vehicle_type_entity.dart';

class VehicleTypeModel extends VehicleTypeEntity {
  const VehicleTypeModel({required super.id, required super.name});

  factory VehicleTypeModel.fromMap(Map<String, dynamic> map) =>
      VehicleTypeModel(id: map['id'], name: map['name']);

  @override
  List<Object?> get props => [id, name];
}
