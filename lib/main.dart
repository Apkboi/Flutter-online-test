import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_app/data/repository/todo_repository.dart';
import 'package:technical_test_app/presentation/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_app/presentation/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 944),

      useInheritedMediaQuery: true,
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => TodosBloc(TodosRepositoryImpl()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const TodoScreen(),
        ),
      ),
    );
  }
}
