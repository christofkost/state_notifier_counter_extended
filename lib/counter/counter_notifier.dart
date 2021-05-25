import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_counter/counter/counter_state.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
        (ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier()
      : super(CounterState(count: 0, countTextColorAsHex: 0xff000000));

  void incrementCounter() {
    final newCount = state.count + 1;
    state = state.copyWith(
        count: newCount, countTextColorAsHex: _getCorrectColor(newCount));
  }

  void decrementCounter() {
    final newCount = state.count - 1;
    state = state.copyWith(
        count: newCount, countTextColorAsHex: _getCorrectColor(newCount));
  }

  int _getCorrectColor(int counter) {
    if (counter > 0) {
      return 0xff00d800; // return green color
    }
    if (counter < 0) {
      return 0xffff0000; // return red color
    }
    return 0xff000000; // return black color
  }
}
