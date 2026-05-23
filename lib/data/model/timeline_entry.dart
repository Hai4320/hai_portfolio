import 'package:hai_portfolio/data/model/education.dart';
import 'package:hai_portfolio/data/model/experience.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/utils/tenure.dart';

enum TimelineEntryKind { work, education }

/// Unified value object for a single point on the career/education timeline.
/// Built from either an [Experience] or an [Education] via factory ctors.
class TimelineEntry {
  final TimelineEntryKind kind;
  final String title;
  final String subtitle;
  final String? location;
  final DateTime startDate;
  final DateTime? endDate;
  final String? description;
  final String? grade;
  final List<String> achievements;
  final List<String> techStack;
  final List<Project> projects;

  const TimelineEntry({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.startDate,
    this.endDate,
    this.location,
    this.description,
    this.grade,
    this.achievements = const [],
    this.techStack = const [],
    this.projects = const [],
  });

  factory TimelineEntry.fromExperience(Experience exp) => TimelineEntry(
    kind: TimelineEntryKind.work,
    title: exp.role,
    subtitle: exp.company,
    location: exp.location,
    startDate: exp.startDate,
    endDate: exp.endDate,
    description: exp.description,
    achievements: exp.achievements,
    techStack: exp.techStack,
    projects: exp.projects,
  );

  factory TimelineEntry.fromEducation(Education edu) => TimelineEntry(
    kind: TimelineEntryKind.education,
    title: edu.degree,
    subtitle: edu.school,
    startDate: edu.startDate,
    endDate: edu.endDate,
    description: edu.description,
    grade: edu.grade,
    techStack: edu.skills,
  );

  Tenure tenure(DateTime now) => Tenure.between(startDate, endDate ?? now);
}
