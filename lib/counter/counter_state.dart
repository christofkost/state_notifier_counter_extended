class CounterState {
  final int count;
  final int countTextColorAsHex;

  CounterState({this.count, this.countTextColorAsHex});

  CounterState copyWith({
    int count,
    int countTextColorAsHex,
  }) {
    return CounterState(
      count: count ?? this.count,
      countTextColorAsHex: countTextColorAsHex ?? this.countTextColorAsHex,
    );
  }
}
