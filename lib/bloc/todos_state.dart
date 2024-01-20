part of 'todos_bloc.dart';

sealed class TodosState extends Equatable {
  final List<Todo> todos;

  const TodosState({required this.todos});

  List<Todo> get filteredTodos => todos; // placeholder

  @override
  List<Object> get props => [todos];
}

final class TodosInitial extends TodosState {
  const TodosInitial() : super(todos: const []);
}

final class TodosCompleted extends TodosState {
  final Filter filter;

  const TodosCompleted({
    required List<Todo> todos,
    this.filter = Filter.all,
  }) : super(todos: todos);

  @override
  List<Todo> get filteredTodos {
    switch (filter) {
      case Filter.completed:
        return todos.where((todo) => todo.isCompleted).toList();
      case Filter.active:
        return todos.where((todo) => !todo.isCompleted).toList();
      case Filter.all:
        return todos;
    }
  }

  @override
  List<Object> get props => [filter, todos];
}

enum Filter { all, active, completed }
