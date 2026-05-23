import 'package:hai_portfolio/data/model/project.dart';

class ProjectData {
  static final List<Project> projects = [
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
