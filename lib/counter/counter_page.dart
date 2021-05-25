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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(builder:
                (BuildContext context, ScopedReader watch, Widget child) {
              final incrementsState = watch(counterStateNotifierProvider);
              return Text(
                '$incrementsState',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .read(counterStateNotifierProvider.notifier)
            .incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
