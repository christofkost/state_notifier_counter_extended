import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_counter/pages/counter/counter_notifier.dart';
import 'package:state_notifier_counter/pages/counter/counter_state.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer(
          builder: (BuildContext context, ScopedReader watch, Widget child) {
        final counterState = watch(counterStateNotifierProvider);
        if (counterState.errorFeedback.isNotEmpty) {
          _showErrorDialog(context, counterState);
        }
        return Stack(
          children: [
            if (counterState.isLoading)
              Align(
                  alignment: Alignment.topCenter,
                  child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color(counterState.countTextColorAsHex)),
                      backgroundColor: Color(counterState.countTextColorAsHex)
                          .withOpacity(0.2))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counterState.count}',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Color(counterState.countTextColorAsHex)),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      backgroundColor: counterState.isLoading
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                      onPressed: counterState.isLoading
                          ? null
                          : () => context
                              .read(counterStateNotifierProvider.notifier)
                              .changeCounter(true),
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      backgroundColor: counterState.isLoading
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                      onPressed: counterState.isLoading
                          ? null
                          : () => context
                              .read(counterStateNotifierProvider.notifier)
                              .changeCounter(false),
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void _showErrorDialog(BuildContext context, CounterState counterState) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('An error occurred'),
            content: SingleChildScrollView(
              child: Text(counterState.errorFeedback),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }
}
