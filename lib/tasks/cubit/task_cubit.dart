import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    loadTasks();
  }

  void loadTasks() {
    emit(TaskLoaded([]));
  }

  void addTask(String title) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final updatedTasks = List<Task>.from(currentState.tasks)
        ..add(Task(title: title));
      emit(TaskLoaded(updatedTasks));
    }
  }

  void toggleTaskCompletion(int index) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final updatedTasks = List<Task>.from(currentState.tasks);
      updatedTasks[index] = Task(
        title: updatedTasks[index].title,
        isCompleted: !updatedTasks[index].isCompleted,
      );
      emit(TaskLoaded(updatedTasks));
    }
  }

  void deleteTask(int index) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final updatedTasks = List<Task>.from(currentState.tasks)..removeAt(index);
      emit(TaskLoaded(updatedTasks));
    }
  }
}
