import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Types of links that can be tracked
enum LinkType { email, github, linkedin, project, resume, works, shelf, other }

/// Analytics event names - extensible for future events
enum AnalyticsEvent {
  // Link events
  linkClick('link_click'),
  emailClick('email_click'),
  socialClick('social_click'),
  projectClick('project_click'),
  resumeClick('resume_click'),

  // Navigation events
  screenView('screen_view'),
  pageScroll('page_scroll'),

  // User interaction events
  buttonClick('button_click'),
  formSubmit('form_submit'),
  searchQuery('search_query'),

  // Content events
  contentView('content_view'),
  downloadFile('download_file'),
  shareContent('share_content'),

  // User engagement events
  languageChange('language_change'),
  themeChange('theme_change'),

  // Error events
  errorOccurred('error_occurred');

  const AnalyticsEvent(this.name);
  final String name;
}

/// Analytics parameter keys - for consistent parameter naming
class AnalyticsParams {
  AnalyticsParams._();

  static const String url = 'url';
  static const String linkType = 'link_type';
  static const String linkText = 'link_text';
  static const String additionalInfo = 'additional_info';
  static const String email = 'email';
  static const String platform = 'platform';
  static const String projectName = 'project_name';
  static const String technologies = 'technologies';
  static const String screenName = 'screen_name';
  static const String buttonName = 'button_name';
  static const String language = 'language';
  static const String theme = 'theme';
  static const String errorMessage = 'error_message';
  static const String contentType = 'content_type';
  static const String contentId = 'content_id';
}

class LinkAnalyticsRepository {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Generic method to log any analytics event
  Future<void> logEvent({required AnalyticsEvent event, Map<String, Object>? parameters}) async {
    try {
      await _analytics.logEvent(name: event.name, parameters: parameters);
    } catch (e) {
      debugPrint('Error logging ${event.name}: $e');
    }
  }

  /// Log a link click event
  Future<void> logLinkClick({
    required String url,
    required LinkType linkType,
    String? linkText,
    String? additionalInfo,
  }) async {
    await logEvent(
      event: AnalyticsEvent.linkClick,
      parameters: {
        AnalyticsParams.url: url,
        AnalyticsParams.linkType: linkType.name,
        if (linkText != null) AnalyticsParams.linkText: linkText,
        if (additionalInfo != null) AnalyticsParams.additionalInfo: additionalInfo,
      },
    );
  }

  /// Log when user opens email link
  Future<void> logEmailClick({String? email}) async {
    await logEvent(event: AnalyticsEvent.emailClick, parameters: {if (email != null) AnalyticsParams.email: email});
  }

  /// Log when user opens social link (GitHub, LinkedIn, etc.)
  Future<void> logSocialClick({required String platform, required String url}) async {
    await logEvent(
      event: AnalyticsEvent.socialClick,
      parameters: {AnalyticsParams.platform: platform, AnalyticsParams.url: url},
    );
  }

  /// Log when user clicks on a project link
  Future<void> logProjectClick({required String projectName, required String url, List<String>? technologies}) async {
    await logEvent(
      event: AnalyticsEvent.projectClick,
      parameters: {
        AnalyticsParams.projectName: projectName,
        AnalyticsParams.url: url,
        if (technologies != null) AnalyticsParams.technologies: technologies.join(', '),
      },
    );
  }

  /// Log when user clicks on resume link
  Future<void> logResumeClick({String? url}) async {
    await logEvent(event: AnalyticsEvent.resumeClick, parameters: {if (url != null) AnalyticsParams.url: url});
  }

  /// Log button click
  Future<void> logButtonClick({required String buttonName}) async {
    await logEvent(event: AnalyticsEvent.buttonClick, parameters: {AnalyticsParams.buttonName: buttonName});
  }

  /// Log language change
  Future<void> logLanguageChange({required String language}) async {
    await logEvent(event: AnalyticsEvent.languageChange, parameters: {AnalyticsParams.language: language});
  }

  /// Log theme change
  Future<void> logThemeChange({required String theme}) async {
    await logEvent(event: AnalyticsEvent.themeChange, parameters: {AnalyticsParams.theme: theme});
  }

  /// Log error occurred
  Future<void> logError({required String errorMessage}) async {
    await logEvent(event: AnalyticsEvent.errorOccurred, parameters: {AnalyticsParams.errorMessage: errorMessage});
  }

  /// Log content view
  Future<void> logContentView({required String contentType, String? contentId}) async {
    await logEvent(
      event: AnalyticsEvent.contentView,
      parameters: {
        AnalyticsParams.contentType: contentType,
        if (contentId != null) AnalyticsParams.contentId: contentId,
      },
    );
  }

  /// Set user properties for better segmentation
  Future<void> setUserProperties({String? preferredLanguage, String? deviceType}) async {
    try {
      if (preferredLanguage != null) {
        await _analytics.setUserProperty(name: 'preferred_language', value: preferredLanguage);
      }
      if (deviceType != null) {
        await _analytics.setUserProperty(name: 'device_type', value: deviceType);
      }
    } catch (e) {
      debugPrint('Error setting user properties: $e');
    }
  }

  /// Log screen view
  Future<void> logScreenView({required String screenName}) async {
    try {
      await _analytics.logScreenView(screenName: screenName);
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }
}
