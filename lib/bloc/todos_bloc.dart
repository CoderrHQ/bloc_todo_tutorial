import 'package:bloc_todo_tutorial/models/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(const TodosInitial()) {
    // Add Todo Event Handler
    on<AddTodoEvent>((event, emit) {
      final newTodos = List.of(state.todos)..add(event.todo);
      emit(TodosCompleted(todos: newTodos));
    });

    // Update Todo Event Hanlder
    on<UpdateTodoEvent>((event, emit) {
      final newTodos = state.todos.map((todo) {
        if (todo.id == event.todo.id) {
          return event.todo;
        } else {
          return todo;
        }
      }).toList();

      emit(TodosCompleted(todos: newTodos));
    });

    // Delete Todo Event Hanlder
    on<DeleteTodoEvent>((event, emit) {
      final newTodos =
          state.todos.where((todo) => todo.id != event.id).toList();

      emit(TodosCompleted(todos: newTodos));
    });

    // Marking todo as complete
    on<MarkTodoAsCompleted>((event, emit) {
      final newTodos = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(isCompleted: event.isCompleted);
        } else {
          return todo;
        }
      }).toList();

      emit(TodosCompleted(todos: newTodos));
    });

    //! Get All Todos Handler
    on<GetAllTodosEvent>((event, emit) {
      emit(TodosCompleted(todos: state.todos));
    });

//! Get Active Todos Handler
    on<GetActiveTodosEvent>((event, emit) {
      emit(TodosCompleted(todos: state.todos, filter: Filter.active));
    });

//! Get Completed Todos Handler
    on<GetCompletedTodosEvent>((event, emit) {
      emit(TodosCompleted(todos: state.todos, filter: Filter.completed));
    });
  }
}
