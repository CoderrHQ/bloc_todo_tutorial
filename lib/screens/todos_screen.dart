import 'package:flutter/material.dart';

import '/screens/add_todo_screen.dart';
import '/widgets/filter_todos_popup_button.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo\'s Screen'),
        actions: const [
          FilterTodosPopupButton(),
        ],
      ),
      body: const TodosScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTodoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
