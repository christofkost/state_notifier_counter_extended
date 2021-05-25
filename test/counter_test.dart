import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_notifier_counter/pages/counter/counter_notifier.dart';
import 'package:state_notifier_counter/pages/counter/counter_state.dart';
import 'package:state_notifier_counter/services/api_service.dart';

class FakeApiProvider implements ApiService {
  @override
  Future<int> getDeOrIncrementFromServer() async {
    return 1;
  }
}

class ErrorFakeApiProvider implements ApiService {
  @override
  Future<int> getDeOrIncrementFromServer() async {
    throw Exception("No internet connection");
  }
}

void main() {
  test('Increment counter', () async {
    final container = ProviderContainer(overrides: [
      apiServiceProvider
          .overrideWithProvider(Provider((ref) => FakeApiProvider()))
    ]);
    addTearDown(container.dispose);
    expect(
      container.read(counterStateNotifierProvider),
      CounterState(
          isLoading: false,
          errorFeedback: "",
          count: 0,
          countTextColorAsHex: 0xff000000),
    );
    container
        .read(counterStateNotifierProvider.notifier)
        .changeCounter(false)
        .then((_) {
      //test behaviour of resolved future
      expect(
        container.read(counterStateNotifierProvider),
        CounterState(
            isLoading: false,
            errorFeedback: "",
            count: 1,
            countTextColorAsHex: 0xff00d800),
      );
    });

    //test loading behaviour as Future has not been resolved
    expect(
      container.read(counterStateNotifierProvider),
      CounterState(
          isLoading: true,
          errorFeedback: "",
          count: 0,
          countTextColorAsHex: 0xff000000),
    );
  });

  test('Decrement counter', () async {
    final container = ProviderContainer(overrides: [
      apiServiceProvider
          .overrideWithProvider(Provider((ref) => FakeApiProvider()))
    ]);
    addTearDown(container.dispose);
    expect(
      container.read(counterStateNotifierProvider),
      CounterState(
          isLoading: false,
          errorFeedback: "",
          count: 0,
          countTextColorAsHex: 0xff000000),
    );
    container
        .read(counterStateNotifierProvider.notifier)
        .changeCounter(true)
        .then((_) {
      //test behaviour of resolved future
      expect(
        container.read(counterStateNotifierProvider),
        CounterState(
            isLoading: false,
            errorFeedback: "",
            count: -1,
            countTextColorAsHex: 0xffff0000),
      );
    });

    //test loading behaviour as Future has not been resolved
    expect(
      container.read(counterStateNotifierProvider),
      CounterState(
          isLoading: true,
          errorFeedback: "",
          count: 0,
          countTextColorAsHex: 0xff000000),
    );
  });
  test('Check error behaviour', () async {
    final container = ProviderContainer(overrides: [
      apiServiceProvider
          .overrideWithProvider(Provider((ref) => ErrorFakeApiProvider()))
    ]);
    addTearDown(container.dispose);
    container
        .read(counterStateNotifierProvider.notifier)
        .changeCounter(true)
        .then((_) {
      //test behaviour of resolved future
      expect(
        container.read(counterStateNotifierProvider),
        CounterState(
            isLoading: false,
            errorFeedback: "Exception: No internet connection",
            count: 0,
            countTextColorAsHex: 0xff000000),
      );
    });

    //test loading behaviour as Future has not been resolved
    expect(
      container.read(counterStateNotifierProvider),
      CounterState(
          isLoading: true,
          errorFeedback: "",
          count: 0,
          countTextColorAsHex: 0xff000000),
    );
  });
}
