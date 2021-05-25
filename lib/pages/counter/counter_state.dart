class CounterState {
  final int count;
  final int countTextColorAsHex;
  final bool isLoading;
  final String errorFeedback;

  CounterState(
      {this.count,
      this.countTextColorAsHex,
      this.isLoading,
      this.errorFeedback});

  CounterState copyWith({
    int count,
    int countTextColorAsHex,
    bool isLoading,
    String errorFeedback,
  }) {
    return CounterState(
      count: count ?? this.count,
      countTextColorAsHex: countTextColorAsHex ?? this.countTextColorAsHex,
      isLoading: isLoading ?? this.isLoading,
      errorFeedback: errorFeedback ?? this.errorFeedback,
    );
  }
}
