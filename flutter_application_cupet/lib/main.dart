import 'package:flutter/material.dart';
import 'package:flutter_application_cupet/src/counter/represntaion/counter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterPage(),
    );
  }
}
