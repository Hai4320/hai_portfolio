// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:web/web.dart' as web;

/// Web implementation to get browser/visitor information
Map<String, dynamic> getWebInfo() {
  try {
    final navigator = web.window.navigator;
    final document = web.window.document;
    final screen = web.window.screen;

    // Parse user agent for browser and device info
    final userAgent = navigator.userAgent;
    final browserInfo = _parseBrowserInfo(userAgent);
    final deviceInfo = _parseDeviceInfo(userAgent);

    return {
      // Platform & Browser
      'platform': navigator.platform,
      'userAgent': userAgent,
      'browser': browserInfo['browser'],
      'browserVersion': browserInfo['version'],

      // Device info
      'deviceType': deviceInfo['type'],
      'os': deviceInfo['os'],
      'osVersion': deviceInfo['osVersion'],
      'isMobile': deviceInfo['isMobile'],
      'isTablet': deviceInfo['isTablet'],

      // Language & Location
      'language': navigator.language,
      'languages': _getLanguages(navigator),

      // Screen info
      'screenWidth': screen.width,
      'screenHeight': screen.height,
      'windowWidth': web.window.innerWidth,
      'windowHeight': web.window.innerHeight,
      'colorDepth': screen.colorDepth,
      'pixelRatio': web.window.devicePixelRatio,

      // Referrer & URL
      'referrer': document.referrer,
      'currentUrl': web.window.location.href,
      'hostname': web.window.location.hostname,
      'pathname': web.window.location.pathname,

      // Connection info
      'onLine': navigator.onLine,
      'cookieEnabled': navigator.cookieEnabled,

      // Hardware
      'hardwareConcurrency': navigator.hardwareConcurrency,
      'maxTouchPoints': navigator.maxTouchPoints,
    };
  } catch (e) {
    return {'platform': 'web', 'error': e.toString()};
  }
}

/// Get list of preferred languages
List<String> _getLanguages(web.Navigator navigator) {
  try {
    return [navigator.language];
  } catch (e) {
    return [navigator.language];
  }
}

/// Parse browser name and version from user agent
Map<String, String> _parseBrowserInfo(String userAgent) {
  String browser = 'Unknown';
  String version = '';

  final ua = userAgent.toLowerCase();

  if (ua.contains('edg/')) {
    browser = 'Microsoft Edge';
    version = _extractVersion(userAgent, RegExp(r'Edg/(\d+[\.\d]*)'));
  } else if (ua.contains('chrome') && !ua.contains('chromium')) {
    browser = 'Google Chrome';
    version = _extractVersion(userAgent, RegExp(r'Chrome/(\d+[\.\d]*)'));
  } else if (ua.contains('firefox')) {
    browser = 'Mozilla Firefox';
    version = _extractVersion(userAgent, RegExp(r'Firefox/(\d+[\.\d]*)'));
  } else if (ua.contains('safari') && !ua.contains('chrome')) {
    browser = 'Apple Safari';
    version = _extractVersion(userAgent, RegExp(r'Version/(\d+[\.\d]*)'));
  } else if (ua.contains('opera') || ua.contains('opr/')) {
    browser = 'Opera';
    version = _extractVersion(userAgent, RegExp(r'(?:Opera|OPR)/(\d+[\.\d]*)'));
  } else if (ua.contains('msie') || ua.contains('trident')) {
    browser = 'Internet Explorer';
    version = _extractVersion(userAgent, RegExp(r'(?:MSIE |rv:)(\d+[\.\d]*)'));
  }

  return {'browser': browser, 'version': version};
}

/// Parse device and OS info from user agent
Map<String, dynamic> _parseDeviceInfo(String userAgent) {
  final ua = userAgent.toLowerCase();

  String os = 'Unknown';
  String osVersion = '';
  String deviceType = 'Desktop';
  bool isMobile = false;
  bool isTablet = false;

  // Detect OS
  if (ua.contains('windows')) {
    os = 'Windows';
    if (ua.contains('windows nt 10')) {
      osVersion = '10/11';
    } else if (ua.contains('windows nt 6.3')) {
      osVersion = '8.1';
    } else if (ua.contains('windows nt 6.2')) {
      osVersion = '8';
    } else if (ua.contains('windows nt 6.1')) {
      osVersion = '7';
    }
  } else if (ua.contains('mac os x')) {
    os = 'macOS';
    osVersion = _extractVersion(userAgent, RegExp(r'Mac OS X (\d+[_\.\d]*)')).replaceAll('_', '.');
  } else if (ua.contains('iphone')) {
    os = 'iOS';
    osVersion = _extractVersion(userAgent, RegExp(r'OS (\d+[_\.\d]*)')).replaceAll('_', '.');
    deviceType = 'Mobile';
    isMobile = true;
  } else if (ua.contains('ipad')) {
    os = 'iPadOS';
    osVersion = _extractVersion(userAgent, RegExp(r'OS (\d+[_\.\d]*)')).replaceAll('_', '.');
    deviceType = 'Tablet';
    isTablet = true;
  } else if (ua.contains('android')) {
    os = 'Android';
    osVersion = _extractVersion(userAgent, RegExp(r'Android (\d+[\.\d]*)'));
    if (ua.contains('mobile')) {
      deviceType = 'Mobile';
      isMobile = true;
    } else {
      deviceType = 'Tablet';
      isTablet = true;
    }
  } else if (ua.contains('linux')) {
    os = 'Linux';
  } else if (ua.contains('cros')) {
    os = 'Chrome OS';
  }

  return {'os': os, 'osVersion': osVersion, 'type': deviceType, 'isMobile': isMobile, 'isTablet': isTablet};
}

/// Extract version number from user agent using regex
String _extractVersion(String userAgent, RegExp pattern) {
  final match = pattern.firstMatch(userAgent);
  return match?.group(1) ?? '';
}
