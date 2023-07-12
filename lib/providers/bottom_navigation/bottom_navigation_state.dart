import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  final int index;
  const BottomNavigationState({
    required this.index,
  });

  factory BottomNavigationState.initial() =>
      const BottomNavigationState(index: 0);

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => true;

  BottomNavigationState copyWith({
    int? index,
  }) {
    return BottomNavigationState(
      index: index ?? this.index,
    );
  }
}
