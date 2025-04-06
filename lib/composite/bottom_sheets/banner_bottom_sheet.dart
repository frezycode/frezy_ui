import 'package:flutter/material.dart';
import 'package:frezy_ui/frezy_ui.dart';

class BannerBottomSheet extends StatelessWidget {
  const BannerBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.illustration,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  final String title;
  final String description;
  final Widget illustration;

  final String buttonTitle;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            illustration,
            SizedBox(height: 32),
            Text(
              title,
              style: theme.textTheme.headlineLarge?.copyWith(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Button(
              title: buttonTitle,
              onPressed: onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
