import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_counter/counter/counter_notifier.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Consumer(builder:
                    (BuildContext context, ScopedReader watch, Widget child) {
                  final counterState = watch(counterStateNotifierProvider);
                  return Text(
                    '${counterState.count}',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Color(counterState.countTextColorAsHex)),
                  );
                }),
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
                    onPressed: () => context
                        .read(counterStateNotifierProvider.notifier)
                        .decrementCounter(),
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () => context
                        .read(counterStateNotifierProvider.notifier)
                        .incrementCounter(),
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
