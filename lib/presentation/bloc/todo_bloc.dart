import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_test_app/data/models/todo.dart';
import 'package:technical_test_app/dormain/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository _todosRepository;
  List<Todo> allTodos = [];

  TodosBloc(this._todosRepository) : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<MarkTodoComplete>(_markTodoComplete);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) async {
    try {
      final todos = await _todosRepository.loadTodos();
      allTodos = todos;
      emit(TodosLoaded(todos));
    } catch (error) {
      emit(TodosError(error.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodosState> emit) async {
    try {
      var todo =
          Todo(id: const Uuid().v1(), text: event.text, completed: false);

      var updatedTodos = await _todosRepository.saveTodo(todo);

      allTodos = updatedTodos;

      emit(TodosLoaded(allTodos));
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<void> _onUpdateTodo(
      UpdateTodo event, Emitter<TodosState> emit) async {
    final updatedTodos =
        await _todosRepository.updateTodo(event.id, event.text);

    allTodos = updatedTodos;

    emit(TodosLoaded(allTodos));
  }

  FutureOr<void> _markTodoComplete(
      MarkTodoComplete event, Emitter<TodosState> emit) async {
    final updatedTodos =
        await _todosRepository.markTodoCompleted(event.id, event.completed);

    allTodos = updatedTodos;

    emit(TodosLoaded(allTodos));
  }
}
