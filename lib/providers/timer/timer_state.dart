// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  final int seconds;
  final int minutes;
  final int hours;
  final int days;
  const TimerState({
    required this.seconds,
    required this.minutes,
    required this.hours,
    required this.days,
  });

  factory TimerState.initial() => const TimerState(
        seconds: 0,
        minutes: 0,
        hours: 0,
        days: 0,
      );

  @override
  List<Object> get props => [seconds, minutes, hours, days];

  @override
  bool get stringify => true;

  TimerState copyWith({
    int? seconds,
    int? minutes,
    int? hours,
    int? days,
  }) {
    return TimerState(
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
      days: days ?? this.days,
    );
  }
}
