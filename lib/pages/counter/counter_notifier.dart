import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_counter/pages/counter/counter_state.dart';
import 'package:state_notifier_counter/services/api_service.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
        (ref) => CounterStateNotifier(ref.read(apiServiceProvider)));

class CounterStateNotifier extends StateNotifier<CounterState> {
  final ApiService _apiService;

  CounterStateNotifier(this._apiService)
      : super(CounterState(
            count: 0,
            countTextColorAsHex: 0xff000000,
            isLoading: false,
            errorFeedback: ""));

  Future<void> changeCounter(bool isDecrement) async {
    try {
      state = state.copyWith(isLoading: true, errorFeedback: "");
      final newCount = state.count +
          await _apiService.getDeOrIncrementFromServer() *
              (isDecrement ? -1 : 1);
      state = state.copyWith(
          count: newCount,
          countTextColorAsHex: _getCorrectColor(newCount),
          isLoading: false);
    } on Exception catch (e) {
      state = state.copyWith(errorFeedback: e.toString(), isLoading: false);
    }
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
