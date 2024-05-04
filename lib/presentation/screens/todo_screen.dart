import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/presentation/bloc/todo_bloc.dart';
import 'package:technical_test_app/presentation/components/custom_fab.dart';
import 'package:technical_test_app/presentation/components/home_app_bar.dart';
import 'package:technical_test_app/presentation/components/home_banner.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';
import 'package:technical_test_app/presentation/screens/todo_list_widget.dart';

import 'add_todo_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TodosBloc>().add(LoadTodos());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton:CustomFab(onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTodoScreen()),
        );
      },),
      body: Column(
        children: [
          const HomeAppBar(),
          const HomeBanner(),
          20.verticalSpace,
          const Expanded(child: TodoList())
        ],
      ),
    );
  }
}
