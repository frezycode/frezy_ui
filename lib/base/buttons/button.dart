import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.title,
    this.titleWidget,
    this.onPressed,
    this.width,
    this.height = 60,
    this.backgroundColor,
  });

  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: titleWidget ??
            Text(
              title!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
