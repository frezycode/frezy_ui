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
    this.loading = false,
    this.borderRadius,
  });

  final bool loading;
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.primaryColor,
          disabledBackgroundColor:
              loading ? theme.colorScheme.primaryContainer : null,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: loading
            ? CircularProgressIndicator(
                color: theme.colorScheme.onPrimaryContainer,
              )
            : titleWidget ??
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
