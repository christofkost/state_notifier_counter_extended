import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>(
        (ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void incrementCounter() {
    state = state + 1; // state++;
  }
}
