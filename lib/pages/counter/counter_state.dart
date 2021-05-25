class CounterState {
  final int count;
  final int countTextColorAsHex;
  final bool isLoading;

  CounterState({this.count, this.countTextColorAsHex, this.isLoading});

  CounterState copyWith({
    int count,
    int countTextColorAsHex,
    bool isLoading,
  }) {
    return CounterState(
      count: count ?? this.count,
      countTextColorAsHex: countTextColorAsHex ?? this.countTextColorAsHex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
