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

  TextEditingController controller = new TextEditingController();

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

  _addTodo() {
    showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('New todo'),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                final todo = new Todo(title: controller.value.text);
                controller.clear();
                todos.add(todo);
                Navigator.of(context).pop(todo);
              },
            ),
          ],
        );
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
