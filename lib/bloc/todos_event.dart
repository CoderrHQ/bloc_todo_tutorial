part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

//! Add Todo
class AddTodoEvent extends TodosEvent {
  final Todo todo;

  const AddTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

//! Delete Todo
class DeleteTodoEvent extends TodosEvent {
  final String id;

  const DeleteTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}

//! Update Todo
class UpdateTodoEvent extends TodosEvent {
  final Todo todo;

  const UpdateTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

//! Mark Todos as completed
class MarkTodoAsCompleted extends TodosEvent {
  final String id;
  final bool isCompleted;

  const MarkTodoAsCompleted({
    required this.id,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [id, isCompleted];
}

//! Get All todos
class GetAllTodosEvent extends TodosEvent {}

//! Get Active todos
class GetActiveTodosEvent extends TodosEvent {}

//! Get Completed todos
class GetCompletedTodosEvent extends TodosEvent {}
