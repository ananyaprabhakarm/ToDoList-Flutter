import 'package:flutter/material.dart';
import 'package:first_app/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  TextEditingController controller = TextEditingController();

  void _toggleTodo(Todo todo, bool? isChecked) {
    if (isChecked != null) {
      setState(() {
        todo.isdone = isChecked;
      });
    }
  }

  Future<void> _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New todo'),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                final todo = Todo(
                  title: controller.value.text,
                );
                controller.clear();
                Navigator.of(context).pop(todo);
              },
            ),
          ],
        );
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

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
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
