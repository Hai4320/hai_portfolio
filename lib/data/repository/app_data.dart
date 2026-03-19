import 'package:hai_portfolio/data/model/app.dart';

class AppData {
  static final List<App> apps = [
    App(
      id: 'health-tracker',
      name: 'Health Tracker',
      shortDescription: 'AI-powered health tracking with exercise detection',
      fullDescription:
          'A comprehensive health application using machine learning to detect and track various exercises in real-time. Features include workout history, health metrics analysis, and personalized recommendations.',
      iconPath: 'assets/images/apps/health-tracker-icon.png',
      screenshotPaths: [
        'assets/images/apps/health-tracker-screenshot-1.png',
        'assets/images/apps/health-tracker-screenshot-2.png',
        'assets/images/apps/health-tracker-screenshot-3.png',
      ],
      features: [
        'ai_detection',
        'exercise_tracking',
        'health_analytics',
        'workout_history',
        'personalized_recommendations',
      ],
      links: [
        AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.health'),
        AppLink(platform: 'web', url: 'https://health-tracker.example.com'),
      ],
      metadata: AppMetadata(
        version: '1.2.0',
        size: '78 MB',
        rating: 4.7,
        downloads: 50000,
        releaseDate: DateTime(2025, 6, 15),
      ),
      termsOfUseKey: 'apps.health_tracker.terms_of_use',
      isFeatured: true,
    ),
    App(
      id: 'food-delivery',
      name: 'Food Delivery Pro',
      shortDescription: 'Modern food delivery app with offline support',
      fullDescription:
          'A professional food delivery application for both stores and customers. Built with clean architecture principles and featuring offline support, real-time tracking, and intuitive order management.',
      iconPath: 'assets/images/apps/food-delivery-icon.png',
      screenshotPaths: [
        'assets/images/apps/food-delivery-screenshot-1.png',
        'assets/images/apps/food-delivery-screenshot-2.png',
        'assets/images/apps/food-delivery-screenshot-3.png',
      ],
      features: [
        'offline_support',
        'real_time_tracking',
        'order_management',
        'store_dashboard',
        'customer_app',
        'clean_architecture',
      ],
      links: [
        AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.fooddelivery'),
        AppLink(platform: 'appstore', url: 'https://apps.apple.com/app/food-delivery-pro/id123456789'),
      ],
      metadata: AppMetadata(
        version: '2.1.0',
        size: '92 MB',
        rating: 4.5,
        downloads: 100000,
        releaseDate: DateTime(2024, 3, 20),
      ),
      termsOfUseKey: 'apps.food_delivery.terms_of_use',
      isFeatured: true,
    ),
    App(
      id: 'short-drama',
      name: 'Drama Stream',
      shortDescription: 'Streaming app for short dramas and series',
      fullDescription:
          'Watch engaging short dramas with high-quality video streaming, user reviews, and curated recommendations. Built with Flutter for optimal performance on all platforms.',
      iconPath: 'assets/images/apps/drama-stream-icon.png',
      screenshotPaths: [
        'assets/images/apps/drama-stream-screenshot-1.png',
        'assets/images/apps/drama-stream-screenshot-2.png',
        'assets/images/apps/drama-stream-screenshot-3.png',
      ],
      features: [
        'video_streaming',
        'user_reviews',
        'curated_recommendations',
        'offline_viewing',
        'hd_quality',
        'multi_language',
      ],
      links: [AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.dramstream')],
      metadata: AppMetadata(
        version: '1.5.0',
        size: '120 MB',
        rating: 4.6,
        downloads: 75000,
        releaseDate: DateTime(2025, 1, 10),
      ),
      termsOfUseKey: 'apps.drama_stream.terms_of_use',
      isFeatured: true,
    ),
    App(
      id: 'my-sleep',
      name: 'Sleep Analytics',
      shortDescription: 'Advanced sleep tracking and analysis',
      fullDescription:
          'Track your sleep patterns with advanced analytics and personalized recommendations. Sleep Analytics uses sophisticated algorithms to provide insights and help you improve your sleep quality.',
      iconPath: 'assets/images/apps/sleep-analytics-icon.png',
      screenshotPaths: [
        'assets/images/apps/sleep-analytics-screenshot-1.png',
        'assets/images/apps/sleep-analytics-screenshot-2.png',
        'assets/images/apps/sleep-analytics-screenshot-3.png',
      ],
      features: [
        'sleep_tracking',
        'advanced_analytics',
        'health_insights',
        'sleep_recommendations',
        'sleep_sounds',
        'data_export',
      ],
      links: [
        AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.sleepanalytics'),
        AppLink(platform: 'appstore', url: 'https://apps.apple.com/app/sleep-analytics/id987654321'),
      ],
      metadata: AppMetadata(
        version: '1.0.0',
        size: '65 MB',
        rating: 4.4,
        downloads: 30000,
        releaseDate: DateTime(2025, 2, 1),
      ),
      termsOfUseKey: 'apps.sleep_analytics.terms_of_use',
      isFeatured: false,
    ),
    App(
      id: 'pachinko-game',
      name: 'Pachinko Master',
      shortDescription: 'Physics-based pachinko game with rewards',
      fullDescription:
          'Experience the classic pachinko gameplay with modern physics simulation and an exciting rewards system. Built with Unity for smooth graphics and engaging gameplay.',
      iconPath: 'assets/images/apps/pachinko-icon.png',
      screenshotPaths: [
        'assets/images/apps/pachinko-screenshot-1.png',
        'assets/images/apps/pachinko-screenshot-2.png',
        'assets/images/apps/pachinko-screenshot-3.png',
      ],
      features: [
        'physics_engine',
        'rewards_system',
        'multiplayer',
        'daily_challenges',
        'leaderboard',
        'smooth_graphics',
      ],
      links: [
        AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.pachinko'),
        AppLink(platform: 'appstore', url: 'https://apps.apple.com/app/pachinko-master/id555666777'),
      ],
      metadata: AppMetadata(
        version: '1.3.0',
        size: '150 MB',
        rating: 4.3,
        downloads: 200000,
        releaseDate: DateTime(2024, 11, 5),
      ),
      termsOfUseKey: 'apps.pachinko_master.terms_of_use',
      isFeatured: false,
    ),
    App(
      id: 'retail-navigator',
      name: 'Retail Navigator',
      shortDescription: 'Indoor navigation using Bluetooth beacons',
      fullDescription:
          'Navigate retail stores with precision using Bluetooth beacon technology. Find products, get offers, and explore stores with our advanced positioning system.',
      iconPath: 'assets/images/apps/retail-icon.png',
      screenshotPaths: [
        'assets/images/apps/retail-screenshot-1.png',
        'assets/images/apps/retail-screenshot-2.png',
        'assets/images/apps/retail-screenshot-3.png',
      ],
      features: [
        'indoor_navigation',
        'beacon_technology',
        'product_discovery',
        'special_offers',
        'store_guide',
        'real_time_updates',
      ],
      links: [
        AppLink(platform: 'playstore', url: 'https://play.google.com/store/apps/details?id=com.hai.retailnav'),
        AppLink(platform: 'web', url: 'https://retail-navigator.example.com'),
      ],
      metadata: AppMetadata(
        version: '1.1.0',
        size: '45 MB',
        rating: 4.2,
        downloads: 25000,
        releaseDate: DateTime(2025, 4, 12),
      ),
      termsOfUseKey: 'apps.retail_navigator.terms_of_use',
      isFeatured: false,
    ),
  ];

  // Get featured apps for home screen
  static List<App> getFeaturedApps({int limit = 3}) {
    return apps.where((app) => app.isFeatured).take(limit).toList();
  }

  // Get app by id
  static App? getAppById(String id) {
    try {
      return apps.firstWhere((app) => app.id == id);
    } catch (e) {
      return null;
    }
  }
}
