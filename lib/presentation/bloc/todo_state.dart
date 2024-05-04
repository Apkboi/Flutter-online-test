part of 'todo_bloc.dart';

abstract class TodosState  {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodosError extends TodosState {
  final String message;

  const TodosError(this.message);

  @override
  List<Object> get props => [message];
}
