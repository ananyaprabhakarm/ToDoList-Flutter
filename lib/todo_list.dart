import 'package:flutter/material.dart';
import 'package:first_app/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool? isChecked) {
    if (isChecked != null) {
      setState(() {
        todo.isdone = isChecked;
      });
    }
  }

  // _buildItem() {}
  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isdone,
      title: Text(todo.title),
      onChanged: (bool? isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    ),
  }
}
