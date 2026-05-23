class Education {
  final String school;
  final String degree;
  final DateTime startDate;
  final DateTime? endDate;
  final String? grade;
  final List<String> skills;
  final String? description;

  Education({
    required this.school,
    required this.degree,
    required this.startDate,
    this.endDate,
    this.grade,
    this.skills = const [],
    this.description,
  }) : assert(endDate == null || !endDate.isBefore(startDate), 'endDate must not be before startDate');
}
