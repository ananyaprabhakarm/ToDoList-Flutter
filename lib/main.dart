import 'package:first_app/todo_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      // home: Scaffold(
      //   appBar: AppBar(title: const Text('To-Do-List')),
      //   body: const TodoList(),
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add)
      //     ,),
      // ),
      home: TodoList(),
    );
  }
}
