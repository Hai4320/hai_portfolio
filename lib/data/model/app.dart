class AppLink {
  final String platform; // 'playstore', 'appstore', 'web'
  final String url;

  AppLink({required this.platform, required this.url});
}

class AppMetadata {
  final String version;
  final String size; // e.g., "45 MB"
  final double rating; // 0-5
  final int downloads; // number of downloads
  final DateTime releaseDate;

  AppMetadata({
    required this.version,
    required this.size,
    required this.rating,
    required this.downloads,
    required this.releaseDate,
  });
}

class App {
  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String iconPath; // path to app icon
  final List<String> screenshotPaths; // list of screenshot paths
  final List<String> features;
  final List<AppLink> links;
  final AppMetadata metadata;
  final String termsOfUseKey; // i18n key for terms of use
  final bool isFeatured; // whether to show on home screen

  App({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.iconPath,
    required this.screenshotPaths,
    required this.features,
    required this.links,
    required this.metadata,
    required this.termsOfUseKey,
    this.isFeatured = false,
  });

  App copyWith({
    String? id,
    String? name,
    String? shortDescription,
    String? fullDescription,
    String? iconPath,
    List<String>? screenshotPaths,
    List<String>? features,
    List<AppLink>? links,
    AppMetadata? metadata,
    String? termsOfUseKey,
    bool? isFeatured,
  }) {
    return App(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      fullDescription: fullDescription ?? this.fullDescription,
      iconPath: iconPath ?? this.iconPath,
      screenshotPaths: screenshotPaths ?? this.screenshotPaths,
      features: features ?? this.features,
      links: links ?? this.links,
      metadata: metadata ?? this.metadata,
      termsOfUseKey: termsOfUseKey ?? this.termsOfUseKey,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }
}
