import 'package:hai_portfolio/data/model/project.dart';

class ProjectData {
  static final List<Project> projects = [
    Project(
      name: 'ThinkSolve101',
      tech: ['Flutter', 'Riverpod', 'Firebase', 'IAP', 'AdMob'],
      description:
          'Published on Play Store — problem-solving toolkit inspired by Problem Solving 101: '
          'decision matrix, logic tree, and gap analyzer. In-app purchase, Remote Config, 3 languages.',
      link: 'https://play.google.com/store/apps/details?id=com.lepetit.hari.think_solve_101',
    ),
    Project(
      name: 'Intermittent Fasting Game',
      tech: ['Flutter', 'Riverpod', 'SQLite', 'Firestore', 'Gamification'],
      description:
          'Gamified intermittent fasting tracker — quests, points ledger, ranks, '
          'history, local reminders, and an optional Google-signed-in Firestore leaderboard.',
      link: 'https://play.google.com/store/apps/details?id=com.lepetit.hari.intermittent_fasting',
    ),
    Project(
      name: 'widget_snap',
      tech: ['Flutter', 'Dart', 'pub.dev', 'Rendering'],
      description:
          'Published Flutter package (v1.2.0) — export any widget to PNG, rendered offscreen, '
          'even content larger than the screen. Zero dependencies, all platforms.',
      link: 'https://pub.dev/packages/widget_snap',
    ),
    Project(
      name: 'Launch My Deeplink',
      tech: ['Flutter', 'Dart', 'Android', 'Deep Links'],
      description:
          'Published on Play Store — a handy dev tool to test and launch custom deep links (URI schemes) on Android.',
      link: 'https://play.google.com/store/apps/details?id=com.lepetit.hari.deeplink',
    ),
    Project(
      name: 'hai_portfolio',
      tech: ['Flutter', 'Dart', 'Firebase', 'Vercel', 'CI'],
      description: 'This portfolio site. Built with Flutter web, deployed on Vercel with Firebase Analytics.',
      link: 'https://github.com/Hai4320/hai_portfolio',
    ),
    Project(
      name: 'vietlot-suggestion',
      tech: ['Python', 'Data Science', 'Backtesting', 'Web'],
      description:
          'Can any algorithm beat random on the Vietnamese lottery? Rigorous backtesting research, '
          'a suggestion toolkit, and a web app. ★ 1',
      link: 'https://github.com/Hai4320/vietlot-suggestion',
    ),
    Project(
      name: 'android-preflight-skills',
      tech: ['Android', 'Gradle', 'Google Play', 'Claude Skill'],
      description:
          'Claude Code skill that scans an Android Gradle project for common Play Store rejection, '
          'policy-violation, and suspension patterns before you submit.',
      link: 'https://github.com/Hai4320/android-preflight-skills',
    ),
    Project(
      name: 'How mobile cross-platform works',
      tech: ['Flutter', 'KMP', 'Compose MP', 'Impeller', 'Skia'],
      description:
          'Research document on the internals of mobile cross-platform frameworks — '
          'rendering, platform architecture, and trade-offs. ★ 2',
      link: 'https://github.com/Hai4320/How-mobile-cross-platform-works',
    ),
    Project(
      name: 'research-toolkit',
      tech: ['Methodology', 'Falsificationist', 'Validation'],
      description:
          'Research methodology toolkit — falsificationist iteration loop, 12-fallacy checklist, '
          'validation protocol, and a domain-agnostic adversarial reviewer agent.',
      link: 'https://github.com/Hai4320/research-toolkit',
    ),
    Project(
      name: 'MyBooks',
      tech: ['JavaScript', 'Node.js', 'Web'],
      description: 'A book management app — early personal project exploring full-stack JavaScript.',
      link: 'https://github.com/Hai4320/MyBooks',
    ),
  ];
}
