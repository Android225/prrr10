import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'task_observer.dart';

void main() {
  Bloc.observer = TaskObserver();
  runApp(App());
}
