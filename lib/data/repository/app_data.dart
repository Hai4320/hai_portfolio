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
        'AI Detection',
        'Exercise Tracking',
        'Health Analytics',
        'Workout History',
        'Personalized Recommendations',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.health',
        ),
        const AppLink(platform: AppPlatform.web, url: 'https://health-tracker.example.com'),
      ],
      metadata: AppMetadata(
        version: '1.2.0',
        size: '78 MB',
        rating: 4.7,
        downloads: 50000,
        releaseDate: DateTime(2025, 6, 15),
      ),
      termsOfUse:
          'Health Tracker Terms of Use and Privacy Policy\n\n'
          '1. Health Data\n'
          'This app collects health data for tracking purposes. Your data is stored locally on your device unless you choose to sync with cloud services.\n\n'
          '2. User Agreement\n'
          'By using this app, you agree to use it only for personal health tracking purposes.\n\n'
          '3. Liability\n'
          'The app provides health insights for informational purposes only and should not be considered as medical advice.',
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
        'Offline Support',
        'Real-time Tracking',
        'Order Management',
        'Store Dashboard',
        'Customer App',
        'Clean Architecture',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.fooddelivery',
        ),
        const AppLink(platform: AppPlatform.appstore, url: 'https://apps.apple.com/app/food-delivery-pro/id123456789'),
      ],
      metadata: AppMetadata(
        version: '2.1.0',
        size: '92 MB',
        rating: 4.5,
        downloads: 100000,
        releaseDate: DateTime(2024, 3, 20),
      ),
      termsOfUse:
          'Food Delivery Pro Terms of Service\n\n'
          '1. Service Description\n'
          'Food Delivery Pro connects customers with local food stores for delivery services.\n\n'
          '2. User Responsibilities\n'
          'Users agree to provide accurate information and use the service legally and responsibly.\n\n'
          '3. Limitation of Liability\n'
          'We are not responsible for food quality or delivery delays caused by third parties.',
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
        'Video Streaming',
        'User Reviews',
        'Curated Recommendations',
        'Offline Viewing',
        'HD Quality',
        'Multi-language',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.dramstream',
        ),
      ],
      metadata: AppMetadata(
        version: '1.5.0',
        size: '120 MB',
        rating: 4.6,
        downloads: 75000,
        releaseDate: DateTime(2025, 1, 10),
      ),
      termsOfUse:
          'Drama Stream Terms of Use\n\n'
          '1. Content License\n'
          'All content in Drama Stream is licensed for personal, non-commercial use only.\n\n'
          '2. Restrictions\n'
          'You may not reproduce, distribute, or transmit any content without permission.\n\n'
          '3. Account Termination\n'
          'We reserve the right to terminate accounts violating these terms.',
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
        'Sleep Tracking',
        'Advanced Analytics',
        'Health Insights',
        'Sleep Recommendations',
        'Sleep Sounds',
        'Data Export',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.sleepanalytics',
        ),
        const AppLink(platform: AppPlatform.appstore, url: 'https://apps.apple.com/app/sleep-analytics/id987654321'),
      ],
      metadata: AppMetadata(
        version: '1.0.0',
        size: '65 MB',
        rating: 4.4,
        downloads: 30000,
        releaseDate: DateTime(2025, 2, 1),
      ),
      termsOfUse:
          'Sleep Analytics Privacy Policy and Terms\n\n'
          '1. Data Privacy\n'
          'Sleep data is stored securely and never shared with third parties without your consent.\n\n'
          '2. Health Information\n'
          'This app is not a medical device and should not replace professional medical advice.\n\n'
          '3. User Consent\n'
          'By using this app, you consent to data collection for improving the service.',
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
        'Physics Engine',
        'Rewards System',
        'Multiplayer',
        'Daily Challenges',
        'Leaderboard',
        'Smooth Graphics',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.pachinko',
        ),
        const AppLink(platform: AppPlatform.appstore, url: 'https://apps.apple.com/app/pachinko-master/id555666777'),
      ],
      metadata: AppMetadata(
        version: '1.3.0',
        size: '150 MB',
        rating: 4.3,
        downloads: 200000,
        releaseDate: DateTime(2024, 11, 5),
      ),
      termsOfUse:
          'Pachinko Master Terms of Service\n\n'
          '1. Game License\n'
          'This game is provided for entertainment purposes only.\n\n'
          '2. In-App Purchases\n'
          'All purchases are final and non-refundable except as required by law.\n\n'
          '3. Fair Play\n'
          'Multiplayer features must be used fairly. Cheating or exploiting bugs is prohibited.',
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
        'Indoor Navigation',
        'Beacon Technology',
        'Product Discovery',
        'Special Offers',
        'Store Guide',
        'Real-time Updates',
      ],
      links: [
        const AppLink(
          platform: AppPlatform.playstore,
          url: 'https://play.google.com/store/apps/details?id=com.hai.retailnav',
        ),
        const AppLink(platform: AppPlatform.web, url: 'https://retail-navigator.example.com'),
      ],
      metadata: AppMetadata(
        version: '1.1.0',
        size: '45 MB',
        rating: 4.2,
        downloads: 25000,
        releaseDate: DateTime(2025, 4, 12),
      ),
      termsOfUse:
          'Retail Navigator Terms and Privacy Policy\n\n'
          '1. Location Data\n'
          'This app uses Bluetooth beacon technology to determine your location within stores. Location data is processed locally and not stored permanently.\n\n'
          '2. Store Partnership\n'
          'Retail Navigator works with partner stores. Terms vary by store.\n\n'
          '3. Accuracy Disclaimer\n'
          'Location accuracy depends on beacon availability and environmental factors.',
      isFeatured: false,
    ),
  ];

  /// Get featured apps for home screen
  static List<App> getFeaturedApps({int limit = 3}) {
    return apps.where((app) => app.isFeatured).take(limit).toList();
  }

  /// Returns null if no app found with the given [id].
  static App? getAppById(String id) {
    return apps.where((app) => app.id == id).firstOrNull;
  }
}
