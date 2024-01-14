import 'package:flutter/material.dart';

import '/models/todo.dart';
import '/screens/add_todo_screen.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Todo task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddTodoScreen(
                todo: task,
              ),
            ),
          );
        },
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {},
        ),
        title: Text(task.title),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
