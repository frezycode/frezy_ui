import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frezy_ui/constants.dart';
import 'package:frezy_ui/frezy_ui.dart';
import 'package:flutter/foundation.dart';

void showPlatformDialog(BuildContext context, ConfirmationDialog dialog) {
  if (!kIsWeb && isApplePlatform) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => dialog,
    );
    return;
  }

  showDialog(context: context, builder: (context) => dialog);
}
