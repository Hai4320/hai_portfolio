# AI Agent Guidelines

## Project Overview

Flutter portfolio website (web-first) with responsive design, i18n support (EN/JA/VI), and Firebase analytics. Uses **FVM** for Flutter version management.

## Architecture

```
lib/
├── main.dart           # Entry point, initializes Firebase & GetX controllers
├── app.dart            # Root widget with GetMaterialApp
├── data/
│   ├── model/          # Plain Dart models (Project, Portfolio)
│   ├── repository/     # Firebase/data access (ViewerRepository, LinkAnalyticsRepository)
│   └── service/        # Business logic facades (LinkAnalyticsService)
├── ui/
│   ├── screens/home/   # Screen + controller pairs
│   │   └── widgets/    # home_web.dart & home_phone.dart (responsive variants)
│   ├── common/         # Reusable widgets (ResponsiveLayout, TextLink, SkillBadge)
│   └── theme/          # AppTheme, AppColors
├── i18n/               # Localization (slang)
└── utils/              # Utilities (LocaleController, constants)
```

## Key Patterns

### State Management: GetX
- Controllers registered in `main.dart` via `Get.put()`
- Access via `Get.find<ControllerName>()` in widgets
- Reactive state with `.obs` and `Obx(() => ...)` widgets

### Responsive Design
Use `ResponsiveLayout` widget with separate UI implementations:
```dart
ResponsiveLayout(webUI: HomeWeb(), phoneUI: HomePhone())
```
Desktop breakpoint: 1000px (see `response_layout.dart`)

### Localization (slang)
- JSON files in `lib/i18n/`: `strings.i18n.json`, `strings_ja.i18n.json`, `strings_vi.i18n.json`
- Access via `t.strings.home.title` (auto-generated `strings.g.dart`)
- Regenerate: `make gen-l10n` or `dart run slang`
- Image paths managed via code generation: `images.i18n.json` → `t.images.avatar`

### Analytics Integration
All external links go through `LinkAnalyticsService.openLink()`:
```dart
Get.find<LinkAnalyticsService>().openLink(url: url, linkType: LinkType.github, linkText: 'GitHub');
```

## Essential Commands

```bash
# Setup (uses FVM)
fvm install && fvm flutter pub get

# Development
fvm flutter run -d chrome

# Code generation (localization)
make gen-l10n

# Pre-commit checks
make pre-commit      # format + lint

# Build & Deploy
fvm flutter build web --release
make deploy  # deploys to Vercel
```

## Code Style

- Line length: 120 characters (`make format`)
- Generated files excluded from linting (see `analysis_options.yaml`)
- Suffix patterns: `*.g.dart`, `*.freezed.dart` = generated, don't edit

## Adding Features

### New Screen
1. Create `lib/ui/screens/<name>/<name>_screen.dart` with `ResponsiveLayout`
2. Create `_web.dart` and `_phone.dart` variants in `widgets/`
3. Add controller if needed: `<name>_controller.dart` extending `GetxController`

### New Translations
1. Add keys to all `strings*.i18n.json` files
2. Run `make gen-l10n`
3. Use via `t.strings.newKey`

### Project Data
Edit `lib/data/repository/project_data.dart` — static list, no backend

## Firebase

- Analytics: `LinkAnalyticsRepository` wraps `FirebaseAnalytics`
- Firestore: `ViewerRepository` tracks page visits in `visits` collection
- Config: `lib/firebase_options.dart` (auto-generated, don't edit manually)

