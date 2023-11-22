import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleTextStyle,
    this.onPressed,
  });
  final String? title;
  final void Function()? onPressed;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: titleTextStyle,
      elevation: 0,
      title: Text(title ?? ''),
      backgroundColor: Colors.transparent,
      leading: Transform.translate(
        offset: const Offset(-10, 0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: onPressed ?? context.router.pop,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
