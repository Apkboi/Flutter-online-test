import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/data/models/todo.dart';
import 'package:technical_test_app/presentation/bloc/todo_bloc.dart';
import 'package:technical_test_app/presentation/components/custom_button.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';

class AddTodoScreen extends StatefulWidget {
  final Todo? todo; // Optional parameter for editing existing Todo

  const AddTodoScreen({Key? key, this.todo}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.todo?.text ?? ''; // Pre-fill text for editing
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.backgroundColor,
      // bottomNavigationBar: ,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Pallets.primary,
        foregroundColor: Colors.white,
        title: TextView(
          text: widget.todo == null ? 'Add New Task' : "Edit Task",
          style: GoogleFonts.roboto(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            shadows: [
              const Shadow(
                // blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(0, 2.0),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            39.verticalSpace,
            const TextView(
              text: 'Task Name',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            15.verticalSpace,
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Pallets.primary),
                  cursorColor: Pallets.primary,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.r),
                          borderSide: const BorderSide(
                              color: Pallets.borderGrey,
                              width: 2,
                              style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.r),
                          borderSide: const BorderSide(
                              color: Pallets.borderGrey,
                              width: 2,
                              style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.r),
                          borderSide: const BorderSide(
                              color: Pallets.borderGrey,
                              width: 2,
                              style: BorderStyle.solid)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.r),
                          borderSide: BorderSide(
                              color: Pallets.borderGrey,
                              width: 2,
                              style: BorderStyle.solid))),
                  controller: _textController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a todo text' : null,
                  onSaved: (newValue) =>
                      setState(() => _textController.text = newValue!),
                ),
              ),
            ),
            CustomNeumorphicButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.todo != null) {
                      context.read<TodosBloc>().add(
                          UpdateTodo(widget.todo!.id, _textController.text));
                    } else {
                      context
                          .read<TodosBloc>()
                          .add(AddTodo(_textController.text));
                    }
                    Navigator.pop(context);
                  }
                },
                color: Pallets.primary,
                child: TextView(
                  text: 'Done',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      const Shadow(
                        // blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(0, 2.0),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
