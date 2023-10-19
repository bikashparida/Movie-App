import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.maxLines = 2,
    required this.fontSize,
    this.color = Colors.white70,
  });
  final String text;
  final int? maxLines;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontSize: fontSize!.h,
        letterSpacing: 0.5,
      ),
    );
  }
}
