import 'package:hai_portfolio/data/model/project.dart';

class ProjectData {
  static final List<Project> projects = [
    Project(
      name: 'Project A',
      tech: ['Flutter', 'Health', "ML Kit"],
      description: 'A health app using Machine Learning detection for exercise tracking.',
      link: 'https://github.com/Hai4320',
    ),
    Project(
      name: 'Food Delivery',
      tech: ['Android', 'Kotlin', 'Clean Architecture'],
      description: 'Store and customer app for food for travelers with offline support.',
      link: 'https://github.com/Hai4320',
    ),
    Project(
      name: 'Short Drama App',
      tech: ['Flutter', 'Video Player', 'Riverpod'],
      description: 'An app for watching short dramas with video streaming and user reviews.',
      link: 'https://github.com/Hai4320',
    ),
    Project(
      name: 'My Sleep',
      tech: ['Flutter', 'Bloc'],
      description: 'Crete a sleep tracking app with sleep analysis and recommendations.',
      link: 'https://github.com/Hai4320',
    ),
    Project(
      name: 'Pachinko Game',
      tech: ['Unity', 'C#'],
      description: 'A pachinko-style game with physics-based gameplay and rewards system.',
      link: 'https://github.com/Hai4320',
    ),
    Project(
      name: 'Retails App',
      tech: ['Kotlin', 'KMP', 'Beacon'],
      description: 'A retail app with indoor positioning using Bluetooth beacons for navigation.',
      link: 'https://github.com/Hai4320',
    ),
  ];
}

