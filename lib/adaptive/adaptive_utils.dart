import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormFactor {
  const FormFactor({
    required this.desktop,
    required this.tablet,
    required this.handset,
  });

  final double desktop;
  final double tablet;
  final double handset;

  static const standart = FormFactor(desktop: 900, tablet: 600, handset: 300);

  static const extended = FormFactor(desktop: 1100, tablet: 600, handset: 300);
}

enum ScreenSize { small, normal, large, extraLarge }

extension ScreenSizeExt on ScreenSize {
  double? get defaultSize {
    switch (this) {
      case ScreenSize.large:
        return FormFactor.standart.tablet;
      case ScreenSize.extraLarge:
        return FormFactor.standart.desktop;
      case ScreenSize.small:
      case ScreenSize.normal:
        return null;
    }
  }

  bool get extraLarge {
    switch (this) {
      case ScreenSize.extraLarge:
        return true;

      case ScreenSize.small:
      case ScreenSize.normal:
      case ScreenSize.large:
        return false;
    }
  }

  bool get large {
    switch (this) {
      case ScreenSize.large:
      case ScreenSize.extraLarge:
        return true;
      case ScreenSize.small:
      case ScreenSize.normal:
        return false;
    }
  }
}

abstract class Adaptive {
  static ScreenSize getSize(
    BuildContext context, {
    FormFactor formFactor = FormFactor.standart,
  }) {
    final deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > formFactor.desktop) return ScreenSize.extraLarge;
    if (deviceWidth > formFactor.tablet) return ScreenSize.large;
    if (deviceWidth > formFactor.handset) return ScreenSize.normal;
    return ScreenSize.small;
  }

  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
}
