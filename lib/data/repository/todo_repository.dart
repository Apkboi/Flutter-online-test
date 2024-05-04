import 'dart:developer';

import 'package:technical_test_app/data/models/todo.dart';
import 'package:technical_test_app/dormain/todo_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  List<Todo> _todos = [];

  @override
  Future<List<Todo>> loadTodos() async {
    // No asynchronous operations needed as data is in memory
    return _todos
        .toList(); // Return a copy to avoid modifying the internal list
  }

  @override
  Future<List<Todo>> saveTodo(Todo todo) async {
    _todos.add(todo);

    return _todos;
  }

  @override
  Future<List<Todo>> updateTodo(String id, String text) async {
    final index = _todos.indexWhere((t) => t.id == id);
    log(text.toString());
    if (index != -1) {
      final updatedTodo = _todos[index].copyWith(text: text);
      _todos[index] = updatedTodo;
      return _todos;
    } else {
      throw Exception('Todo with ID ${id} not found');
    }
  }

  @override
  Future<List<Todo>> deleteTodo(String id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos.removeAt(index);
      return _todos;
    } else {
      throw Exception('Todo with ID $id not found');
    }
  }

  @override
  Future<List<Todo>> markTodoCompleted(String id, bool completed) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      final updatedTodo = _todos[index].copyWith(completed: completed);
      _todos[index] = updatedTodo;

      return _todos;
    } else {
      throw Exception('Todo with ID $id not found');
    }
  }
}
