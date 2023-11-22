import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    required this.text,
    super.key,
    this.fontsize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });
  final double? fontsize;
  final FontWeight? fontWeight;
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize ?? context.textTheme.titleLarge?.fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
