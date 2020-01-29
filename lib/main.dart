import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter"),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              "${counterBloc.state}",
              style: TextStyle(fontSize: 36),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterBloc.add(Increment());
            },
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(Decrement());
              // counterBloc.a
              // BlocProvider.of<CounterBloc>(context).di(Increment());
            },
          )
        ],
      ),
    );
  }
}
