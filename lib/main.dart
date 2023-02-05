import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CounterOne(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "AndroidVille Provider Pattern"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title});

  void _incrementCounter(BuildContext context) {
    Provider.of<CounterOne>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider
        .of<CounterOne>(context)
        .getCounter;
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
            Text(
              '$counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}