import 'package:neuro_wood/app/domain/entities/parameters_measure/bread_entity.dart';

class BreadModel extends BreadEntity {
  const BreadModel({
    required int id,
    required String name,
    required bool state,
  }) : super(
          id: id,
          name: name,
          state: state,
        );

  factory BreadModel.fromMap(Map<String, dynamic> map) => BreadModel(
        id: map['id'],
        name: map['name'],
        state: map['state'],
      );

  @override
  List<Object?> get props => [id, name, state];
}
