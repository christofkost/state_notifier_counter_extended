import 'dart:ui';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState &&
        other.count == count &&
        other.countTextColorAsHex == countTextColorAsHex &&
        other.isLoading == isLoading &&
        other.errorFeedback == errorFeedback;
  }

  @override
  int get hashCode {
    return hashList([
      count,
      countTextColorAsHex,
      isLoading,
      errorFeedback,
    ]);
  }
}
