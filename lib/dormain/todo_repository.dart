import 'package:technical_test_app/data/models/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> loadTodos();
  Future<List<Todo>> saveTodo(Todo todo);
  Future<List<Todo>> updateTodo(String id, String text);
  Future<List<Todo>> deleteTodo(String id);
  Future<List<Todo>> markTodoCompleted(String id, bool completed);
}