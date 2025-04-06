import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frezy_ui/constants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return CupertinoActivityIndicator();
    }
    return CircularProgressIndicator();
  }
}
