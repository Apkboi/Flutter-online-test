import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextView extends StatelessWidget {
  final GlobalKey? textKey;
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? align;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? style;
  final TextDecoration? decoration;
  final double? wordSpacing;

  final List<Shadow>? shadows;

  const TextView({
    super.key,
    this.textKey,
    required this.text,
    this.textOverflow = TextOverflow.clip,
    this.align = TextAlign.left,
    this.color,
    this.onTap,
    this.fontSize,
    this.lineHeight,
    this.style,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.decoration,
    this.fontStyle = FontStyle.normal,
    this.decorationColor,
    this.wordSpacing, this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        key: textKey,

        // textScaleFactor: ScreenUtil().textScaleFactor,
        style: style?.copyWith(inherit: true) ??
            GoogleFonts.roboto(
                    color: color,
                    decoration: decoration,
                    decorationColor: decorationColor,
                    fontWeight: fontWeight,
                    fontSize: fontSize?.sp ?? 15.sp,
                    fontStyle: fontStyle,
                    height: lineHeight,
                    shadows:shadows ,
                    wordSpacing: wordSpacing)
                .copyWith(inherit: true),
        textAlign: align,
        overflow: textOverflow,

        maxLines: maxLines,
      ),
    );
  }
}
