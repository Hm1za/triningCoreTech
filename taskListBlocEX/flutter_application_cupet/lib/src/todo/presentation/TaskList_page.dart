import 'package:flutter/material.dart';
import 'package:flutter_application_cupet/src/todo/logic/cubit/task_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Data/TaskModel.dart';

class TasklistPage extends StatelessWidget {
  const TasklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Task To be Done !')
          ),
          body: () {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
          final tasks = state.tasks;

          if (tasks.isEmpty) {
            return const Center(child: Text('No Task yet'));
          }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
          final task = tasks[index];
            return ListTile(
              title: Text(task.titel),
              leading: Checkbox(
              value: task.isDone,
              onChanged: (_) {
              context.read<TaskCubit>().toggleTask(task.id as String);
              },
              ),
              trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
              context.read<TaskCubit>().deleteTask(task.id as String);
            },
          ),
        );
      },
    );
  } else {
    return const Center(child: Text('Erorre acourd'));
  }
}(),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              _AddTaskDialog(context);
            },
            child: Icon(Icons.add_box)),
        );
      },
    );
  }
  void _AddTaskDialog(BuildContext context) {
  final TextEditingController _controller = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Task'),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: ' task titel',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final titel = _controller.text.trim();
              if (titel.isEmpty) return;

              final task = Task(
                id: DateTime.now().toIso8601String(),
                titel: titel,
                isDone: false, 
              );

              context.read<TaskCubit>().addTask(task);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

}