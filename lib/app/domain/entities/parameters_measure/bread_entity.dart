import 'package:equatable/equatable.dart';

class BreadEntity extends Equatable {
  final int id;
  final String name;
  final bool state;

  const BreadEntity({
    required this.id,
    required this.name,
    required this.state,
  });

  @override
  List<Object?> get props => [id, name, state];
}
