import 'package:flutter/material.dart';
import 'package:frezy_ui/adaptive/adaptive_layout_builder.dart';
import 'package:frezy_ui/adaptive/adaptive_utils.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.child,
    this.tablet,
    this.desktop,
    this.formFactor = FormFactor.standart,
    this.maxHeight,
    this.maxWidth,
  });

  final Widget child;
  final Widget? tablet;
  final Widget? desktop;
  final FormFactor formFactor;
  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayoutBuilder(
      formFactor: formFactor,
      builder: (context, deviceScreenSize) {
        final useConstraints = tablet == null && desktop == null;
        if (useConstraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(
                width: maxWidth ?? deviceScreenSize.defaultSize,
                height: maxHeight,
              ),
              child: child,
            ),
          );
        }
        switch (deviceScreenSize) {
          case ScreenSize.small:
          case ScreenSize.normal:
            return child;
          case ScreenSize.large:
            return tablet ?? child;
          case ScreenSize.extraLarge:
            return desktop ?? tablet ?? child;
        }
      },
    );
  }
}
