import 'package:flutter/material.dart';

import '/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({
    super.key,
    this.todo,
  });

  final Todo? todo;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  bool isEditing = false;
  Todo? todo;

  @override
  void initState() {
    if (widget.todo != null) {
      isEditing = true;
      _titleController.text = widget.todo!.title;
      todo = widget.todo;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Task Title'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Close the screen after adding the task
                Navigator.pop(context);
              },
              child: Text(
                isEditing ? 'Update Task' : 'Add Task',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
