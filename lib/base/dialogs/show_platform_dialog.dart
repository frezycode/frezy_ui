import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frezy_ui/constants.dart';
import 'package:frezy_ui/frezy_ui.dart';

void showPlatformDialog(BuildContext context, ConfirmationDialog dialog) {
  if (isApplePlatform) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => dialog,
    );
    return;
  }

  showDialog(context: context, builder: (context) => dialog);
}
