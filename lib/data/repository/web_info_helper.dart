import 'package:flutter/foundation.dart';

/// Stub implementation for non-web platforms
Map<String, dynamic> getWebInfo() {
  return {
    'platform': defaultTargetPlatform.name,
    'userAgent': '',
    'language': '',
    'referrer': '',
    'screenWidth': 0,
    'screenHeight': 0,
  };
}
