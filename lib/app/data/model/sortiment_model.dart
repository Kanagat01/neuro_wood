import 'package:neuro_wood/app/domain/entities/parameters_measure/sortiment_entity.dart';

class SortimentModel extends SortimentEntity {
  const SortimentModel({required super.id, required super.name});

  factory SortimentModel.fromMap(Map<String, dynamic> map) =>
      SortimentModel(id: map['id'], name: map['name']);

  @override
  List<Object?> get props => [id, name];
}
