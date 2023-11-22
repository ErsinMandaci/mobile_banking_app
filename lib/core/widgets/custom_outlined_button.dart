import 'package:banking_mobile_app/core/extension/context_extension.dart';
import 'package:banking_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, this.width, this.height, this.icon, this.label, this.onPressed});
  final double? width;
  final double? height;
  final Widget? icon;
  final Widget? label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.9,
      height: height ?? context.height * 0.06,
      child: OutlinedButton.icon(
        icon: Center(
          child: icon ??
              Image.asset(
                Assets.icons.google.path,
                width: 25,
              ),
        ),
        onPressed: onPressed,
        label: label ?? const Text(''),
      ),
    );
  }
}
