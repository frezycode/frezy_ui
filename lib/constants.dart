import 'package:flutter/foundation.dart';

final isApplePlatform = [
  TargetPlatform.iOS,
  TargetPlatform.macOS,
].contains(defaultTargetPlatform);
