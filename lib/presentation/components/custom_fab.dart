import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';

import '../../core/pallets.dart';
class CustomFab extends StatelessWidget {
  const CustomFab({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      onTap();
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
    );
  }
}
