class Project {
  final String name;
  final List<String> tech;
  final String description;
  final String link;

  Project({
    required this.name,
    required this.tech,
    required this.description,
    required this.link,
  });

  Project copyWith({
    String? name,
    List<String>? tech,
    String? description,
    String? link,
  }) {
    return Project(
      name: name ?? this.name,
      tech: tech ?? this.tech,
      description: description ?? this.description,
      link: link ?? this.link,
    );
  }
}
