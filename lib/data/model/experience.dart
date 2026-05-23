import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/utils/tenure.dart';

class Experience {
  final String company;
  final String role;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;
  final List<String> achievements;
  final List<String> techStack;
  final List<Project> projects;
  final String? companyUrl;

  Experience({
    required this.company,
    required this.role,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.achievements,
    required this.techStack,
    this.projects = const [],
    this.companyUrl,
  }) : assert(endDate == null || !endDate.isBefore(startDate), 'endDate must not be before startDate');

  Tenure tenure(DateTime now) => Tenure.between(startDate, endDate ?? now);
}
