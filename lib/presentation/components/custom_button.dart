import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test_app/core/pallets.dart';
import 'package:technical_test_app/presentation/components/text_view.dart';

class CustomNeumorphicButton extends StatelessWidget {
  const CustomNeumorphicButton(
      {super.key,
      this.text,
      required this.onTap,
      required this.color,
      this.fgColor = Colors.white,
      this.expanded = true,
      this.child,
      this.padding,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.shape});

  final String? text;
  final Widget? child;
  final VoidCallback onTap;
  final Color color;
  final Color? fgColor;
  final bool? expanded;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 2.5),

          // constraints:
          //     expanded! ? BoxConstraints(maxWidth: 1.sw - 127.w) : null,
          decoration: ShapeDecoration(
            color: Pallets.buttonBorder,
            shape: shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 1),

            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  Colors.white.withOpacity(0.32),
                  color.withOpacity(0.9),
                  color.withOpacity(0.9),
                  color.withOpacity(0.9),
                  color.withOpacity(0.9)
                ],
              ),
              shape: shape ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: color)),
            ),
            child: Container(
              decoration: ShapeDecoration(
                color: color,
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
              ),
              child: Padding(
                padding: padding ??
                    const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 30),
                child: expanded!
                    ? Row(
                        mainAxisAlignment: mainAxisAlignment!,
                        // mainAxisSize: expanded! ? MainAxisSize.max : MainAxisSize.min,
                        children: [
                          IgnorePointer(
                            ignoring: true,
                            child: Center(
                              child: child ??
                                  TextView(
                                    text: text ?? 'Button',
                                    align: TextAlign.center,
                                    style: TextStyle(
                                      color: fgColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      )
                    : child ??
                        TextView(
                          text: text ?? 'Button',
                          align: TextAlign.center,

                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                // blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(0, 2.0),
                              ),
                            ],
                          ),
                          // style: TextStyle(
                          //
                          // ),
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
