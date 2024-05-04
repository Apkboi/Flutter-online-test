import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/presentation/bloc/todo_bloc.dart';
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
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Pallets.fabBorder,
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Colors.grey.shade500, Pallets.primary])),
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              decoration: const BoxDecoration(
                  color: Pallets.primary, shape: BoxShape.circle),
              // alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 24),
              child: TextView(
                text: '+',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    const Shadow(
                      // blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(0, 3.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            const HomeBanner(),
            20.verticalSpace,
            const Expanded(child: TodoList())
          ],
        ),
      ),
    );
  }
}
