import 'package:hai_portfolio/data/model/education.dart';
import 'package:hai_portfolio/data/model/experience.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/data/model/timeline_entry.dart';

class ExperienceData {
  static final List<Experience> experiences = [
    Experience(
      company: 'Sun* Vietnam',
      role: 'Mobile Engineer',
      location: 'Ho Chi Minh City, Vietnam',
      startDate: DateTime(2023, 6),
      endDate: null,
      description:
          'Building cross-platform mobile applications using Flutter, KMP, and Unity. '
          'Passionate about visually appealing, high-performance apps that work seamlessly on Android and iOS.',
      achievements: [
        'Patented a unique scoring algorithm for workout performance metrics.',
        'Improved app start-up performance by 25% via code optimization and Firebase Performance.',
        'Built scalable base unit testing framework, reducing regression bugs by 30%.',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Kotlin',
        'Kotlin Multiplatform',
        'Android',
        'Jetpack Compose',
        'Unity',
        'Riverpod',
        'Bloc',
        'Firebase',
      ],
      projects: [
        Project(
          name: 'Fintech eKYC SDK',
          tech: ['Android', 'Jetpack Compose', 'eKYC', 'Biometrics'],
          description:
              'Designing a mobile SDK for the fintech domain — eKYC, identity verification, '
              'and biometric checks for partner integrations.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'Health & Fitness app',
          tech: ['Flutter', 'ML Kit', 'Firebase'],
          description: '50k+ users on Play Store & App Store. ML-based exercise detection with a patented scoring algorithm.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'E-commerce Styling app',
          tech: ['Flutter', 'Firebase', 'Riverpod'],
          description: '1k+ MAU fashion marketplace with real-time chat between customers and stylists.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'Short Drama Streaming app',
          tech: ['Flutter', 'Video Player', 'Riverpod'],
          description: 'Short-form video streaming with reviews and recommendations.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'Sleep Tracker app',
          tech: ['Flutter', 'Bloc'],
          description: 'Sleep tracking with analysis and personalized recommendations.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'Pachinko Game',
          tech: ['Unity', 'C#'],
          description: 'Physics-based pachinko mini-game with a rewards system.',
          link: 'https://github.com/Hai4320',
        ),
        Project(
          name: 'Retail Beacon app',
          tech: ['Kotlin', 'KMP', 'Bluetooth Beacon'],
          description: 'Indoor positioning and navigation using Bluetooth beacons.',
          link: 'https://github.com/Hai4320',
        ),
      ],
      companyUrl: 'https://sun-asterisk.com/',
    ),
    Experience(
      company: 'Sun* Vietnam',
      role: 'Android Developer',
      location: 'Ho Chi Minh City, Vietnam',
      startDate: DateTime(2022, 5),
      endDate: DateTime(2023, 5),
      description:
          'Building high-quality Android applications with Kotlin, focused on architecture components, '
          'Clean Architecture, and strong test coverage.',
      achievements: [
        'Achieved 90%+ unit test coverage with JUnit, MockK, Mockito; reduced bugs by 25%.',
      ],
      techStack: ['Kotlin', 'Android SDK', 'Jetpack Compose', 'ViewModel', 'LiveData', 'Room', 'Clean Architecture'],
      projects: [
        Project(
          name: 'Food Ordering app',
          tech: ['Android', 'Kotlin', 'Clean Architecture'],
          description: '10k+ downloads with a 4.5★ rating on Play Store. Store and customer apps with offline support.',
          link: 'https://github.com/Hai4320',
        ),
      ],
      companyUrl: 'https://sun-asterisk.com/',
    ),
  ];

  static final List<Education> educations = [
    Education(
      school: 'University of Information Technology',
      degree: "Bachelor's degree, Information Technology",
      startDate: DateTime(2018, 10),
      endDate: DateTime(2022, 8),
      grade: '8.0 / 10',
      skills: ['Android', 'Python', 'Node.js', 'React', 'React Native'],
    ),
  ];

  /// Unified, time-sorted (newest first) view of work + education entries.
  /// Computed once at static-init; data is immutable so no per-build cost.
  static final List<TimelineEntry> timeline = [
    ...experiences.map(TimelineEntry.fromExperience),
    ...educations.map(TimelineEntry.fromEducation),
  ]..sort((a, b) => b.startDate.compareTo(a.startDate));
}
