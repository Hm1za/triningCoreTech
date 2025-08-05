import 'package:flutter/material.dart';
import 'package:flutter_application_cupet/src/todo/logic/cubit/task_cubit.dart';
import 'package:flutter_application_cupet/src/todo/presentation/TaskList_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TaskCubit()..loadTasks(),
      child: const MainApp(),
    ),
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasklistPage(),
    );
  }
}