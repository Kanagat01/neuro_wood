import 'package:equatable/equatable.dart';

class SortimentEntity extends Equatable{
  final int id;
  final String name;

  const SortimentEntity({
    required this.id,
    required this.name,
  });
  
  @override
  List<Object?> get props => [id, name];
}
