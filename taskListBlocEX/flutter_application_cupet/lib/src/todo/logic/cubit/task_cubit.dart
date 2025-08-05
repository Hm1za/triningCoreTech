import 'package:bloc/bloc.dart';
import 'package:flutter_application_cupet/src/todo/Data/TaskModel.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  List<Task> _tasks = [];

  void loadTasks() async {
    emit(TaskLoading());

    await Future.delayed(Duration(seconds: 1)); 
    emit(TaskLoaded(_tasks));
  }

  void addTask(Task task) {
    _tasks.add(task);
    emit(TaskLoaded(List.from(_tasks)));
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    emit(TaskLoaded(List.from(_tasks)));
  }

  void toggleTask(String id) {
  _tasks = _tasks.map((task) {
    if (task.id == id) {
      return Task(
        id: task.id,
        titel: task.titel,
        isDone: task.isDone,
      );
    }
    return task;
  }).toList();

  emit(TaskLoaded(List.from(_tasks)));
}

}

