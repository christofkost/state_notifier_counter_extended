import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_counter/counter/counter_state.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
        (ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier()
      : super(CounterState(count: 0, countTextColorAsHex: 0xff000000));

  void incrementCounter() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrementCounter() {
    state = state.copyWith(count: state.count - 1);
  }
}
