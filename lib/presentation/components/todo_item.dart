import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/data/models/todo.dart';
import '../screens/add_todo_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  final Function() onToggleComplete;

  const TodoItem({Key? key, required this.todo, required this.onToggleComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // Adjust opacity for desired intensity
            blurRadius: 5.0,
            // Adjust blurRadius for shadow softness
            spreadRadius: 0.0, // Set to 0 for no additional spread
          ),
        ],
        // Other container decorations (if needed)
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              onToggleComplete();
            },
            child: AnimatedCrossFade(
                firstChild: const _UnChekedCircle(),
                secondChild: const _ChekedCircle(),
                crossFadeState: todo.completed
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200)),
          ),
          17.horizontalSpace,
          Expanded(
            child: Text(
              todo.text,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: todo.completed
                    ? Pallets.borderGrey
                    : Pallets.bannerTextColor,
                decorationColor: Pallets.borderGrey,
                decoration: todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(color: Pallets.bannerTextColor)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTodoScreen(
                            todo: todo,
                          )),
                );
              },
              child: Text(
                'Edit',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.bannerTextColor),
              ))
        ],
      ),
    );
  }
}

class _ChekedCircle extends StatelessWidget {
  const _ChekedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Pallets.checkedBg,
          border: Border.all(
            color: Pallets.checkedBorder,
          )),
      child: const Center(
          child: Icon(
        Icons.check,
        color: Pallets.checkedIcon,
      )),
    );
  }
}

class _UnChekedCircle extends StatelessWidget {
  const _UnChekedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Pallets.checkedBg,
          border: Border.all(
            color: Pallets.bannerTextColor,
          )),
    );
  }
}
