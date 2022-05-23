part of 'counter_cubit.dart';

class CcounterState extends Equatable {
  final int counter;
  CcounterState({
    required this.counter,
  });

  factory CcounterState.initial() {
    return CcounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  CcounterState copyWith({
    int? counter,
  }) {
    return CcounterState(
      counter: counter ?? this.counter,
    );
  }
}
