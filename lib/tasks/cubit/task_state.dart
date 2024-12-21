import 'package:equatable/equatable.dart';

class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

abstract class TaskState extends Equatable {
  const TaskState();
  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  TaskLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}
