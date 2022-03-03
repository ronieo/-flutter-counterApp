part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    // initial state로 활용하기 위해
    return CounterState(counter: 0);
  } //counter 값이 0인 CounterState의 인스턴스를 리턴

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
