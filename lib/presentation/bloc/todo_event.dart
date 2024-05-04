part of 'todo_bloc.dart';

// Events for Todos
abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final String text;

  const AddTodo(this.text);

  @override
  List<Object> get props => [text];
}

class UpdateTodo extends TodosEvent {
  final String id;
  final String text;

  const UpdateTodo(this.id, this.text);

  @override
  List<Object> get props => [id, text];
}

class MarkTodoComplete extends TodosEvent {
  final String id;
  final bool completed;

  const MarkTodoComplete(this.id, this.completed);

  @override
  List<Object> get props => [id, completed];
}
