import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_app/presentation/bloc/todo_bloc.dart';
import 'package:technical_test_app/presentation/components/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosBloc, TodosState>(
      listener: (context, state) {},
      builder: (context, state) {
        var allTodos = context.watch<TodosBloc>().allTodos;
        return ListView.builder(
          itemCount: allTodos.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final todo = allTodos[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: TodoItem(
                todo: todo,
                onToggleComplete: () {
                  context
                      .read<TodosBloc>()
                      .add(MarkTodoComplete(todo.id, !todo.completed));
                },
              ),
            );
          },
        );
      },
    );
  }
}
