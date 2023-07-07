import 'package:equatable/equatable.dart';

enum FloorType {
  ground,
  underground,
}

class FloorState extends Equatable {
  final FloorType floorType;
  final int floor;

  const FloorState({
    required this.floorType,
    required this.floor,
  });

  factory FloorState.initial() {
    return const FloorState(floorType: FloorType.ground, floor: 1);
  }

  @override
  List<Object> get props => [floorType, floor];

  @override
  bool get stringify => true;

  FloorState copyWith({
    FloorType? floorType,
    int? floor,
  }) {
    return FloorState(
      floorType: floorType ?? this.floorType,
      floor: floor ?? this.floor,
    );
  }
}
