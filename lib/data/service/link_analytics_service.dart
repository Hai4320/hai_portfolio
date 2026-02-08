import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/link_analytics_repository.dart';
import 'package:url_launcher/url_launcher.dart';

/// Service to handle link analytics and URL launching
/// This service acts as a facade between the UI and the repository
class LinkAnalyticsService extends GetxService {
  final LinkAnalyticsRepository _repository = LinkAnalyticsRepository();

  /// Open a link and log the analytics
  Future<void> openLink({
    required String url,
    required LinkType linkType,
    String? linkText,
    String? additionalInfo,
  }) async {
    // Log analytics (fire and forget)
    _repository.logLinkClick(url: url, linkType: linkType, linkText: linkText, additionalInfo: additionalInfo);

    // Launch the URL
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  /// Log screen view for analytics
  Future<void> logScreenView({required String screenName}) => _repository.logScreenView(screenName: screenName);

  /// Set user properties for better segmentation
  Future<void> setUserProperties({String? preferredLanguage, String? deviceType}) =>
      _repository.setUserProperties(preferredLanguage: preferredLanguage, deviceType: deviceType);
}
