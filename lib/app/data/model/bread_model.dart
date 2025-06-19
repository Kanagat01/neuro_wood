import 'package:neuro_wood/app/domain/entities/parameters_measure/bread_entity.dart';

class BreadModel extends BreadEntity {
  const BreadModel({
    required super.id,
    required super.name,
    required super.state,
  });

  factory BreadModel.fromMap(Map<String, dynamic> map) =>
      BreadModel(id: map['id'], name: map['name'], state: map['state']);

  @override
  List<Object?> get props => [id, name, state];
}
