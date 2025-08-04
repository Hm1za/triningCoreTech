import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/src/counter_ev/represntaion/counter_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_bloc/src/counter_ev/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}
