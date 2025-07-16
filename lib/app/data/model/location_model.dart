import 'package:neuro_wood/app/domain/entities/parameters_measure/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({required super.id, required super.name});

  factory LocationModel.fromMap(Map<String, dynamic> map) =>
      LocationModel(id: map['id'], name: map['name']);

  @override
  List<Object?> get props => [id, name];
}
