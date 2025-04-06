import 'package:flutter/material.dart';
import 'package:frezy_ui/adaptive/adaptive_utils.dart';

class AdaptiveLayoutBuilder extends StatelessWidget {
  const AdaptiveLayoutBuilder({
    super.key,
    required this.builder,
    this.formFactor = FormFactor.standart,
  });

  final Widget Function(BuildContext context, ScreenSize size) builder;
  final FormFactor formFactor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final deviceScreenSize = Adaptive.getSize(
        context,
        formFactor: formFactor,
      );
      return builder.call(context, deviceScreenSize);
    });
  }
}
