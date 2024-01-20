import 'package:bloc_todo_tutorial/bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
<<<<<<< Updated upstream
      body: const TodosScreen(),
=======
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          final todos = state.filteredTodos;

          if (todos.isNotEmpty) {
            return TasksList(tasks: todos);
          }

          return Center(
            child: Text(
              'No todos for now',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        },
      ),
>>>>>>> Stashed changes
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
