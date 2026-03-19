# AI Agent Guidelines

## Project Overview

Flutter portfolio website (web-first) with responsive design, i18n support (EN/JA/VI), and Firebase analytics. Uses **FVM** for Flutter version management (3.35.6).

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
- Images also localized: `images.i18n.json` → `t.images.avatar`

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
./scripts/deploy.sh  # deploys to Vercel
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

# AGENTS Guide

## Project shape
- Flutter portfolio app/site with a single entry experience (`HomeScreen`) split into web + phone UIs via `ResponsiveLayout` (`lib/ui/common/response_layout.dart`).
- Main bootstrap is `lib/main.dart`: initializes Firebase, registers GetX dependencies (`LocaleController`, `ViewerController`, `LinkAnalyticsService`), wraps app with Slang `TranslationProvider`.
- Root app widget is `MyApp` in `lib/app.dart` (`GetMaterialApp`, dark theme, i18n locale wiring, `FireworkClickEffect`).

## Architecture and data flow
- UI -> service -> repository pattern is used for outbound links:
  - `TextLink`/`ImageLink`/`ProjectBloc` call `Get.find<LinkAnalyticsService>().openLink(...)`.
  - `LinkAnalyticsService` logs event through `LinkAnalyticsRepository` then launches URL (`url_launcher`).
- Viewer counter flow:
  - `ViewerController.onInit()` calls `ViewerRepository.incrementViewerCount()`.
  - Repository logs a `visits` document in Firestore, then reads count (`count().get()`).
  - `ViewerCounterWidget` and nav widgets consume `viewerCount` reactively with `Obx`/`GetX`.
- Platform-specific visitor metadata uses conditional imports in `lib/data/repository/viewer_repository.dart`:
  - non-web: `web_info_helper.dart` stub
  - web: `web_info_helper_web.dart` (browser/device/screen/referrer fields)

## Localization and content conventions
- Localization uses Slang (`slang.yaml`) with source files in `lib/i18n/*.i18n.json`; generated file is `lib/i18n/strings.g.dart`.
- Access strings through `t.strings...` / `t.images...` (see `home_web.dart`, `home_phone.dart`).
- Locale state is centralized in `LocaleController` with `SharedPreferences` persistence (`selected_locale`).
- `ProjectData.projects` in `lib/data/repository/project_data.dart` is the current project catalog source for cards.

## Developer workflows (repo-specific)
- README states Flutter `3.35.6` via FVM; prefer `fvm flutter ...` for app/build commands.
- Common commands:
  - `fvm flutter pub get`
  - `fvm flutter run -d chrome`
  - `fvm flutter build web --release`
- Utility scripts:
  - `scripts/deploy.sh` (clean, pub get, build web, `vercel --prod`)
  - `scripts/format.sh`, `scripts/lint.sh`, `scripts/fix.sh`
- `Makefile` mirrors format/lint/build tasks; it currently calls `flutter`/`dart` directly (no `fvm` prefix).

## Editing guardrails for agents
- Do not manually edit generated or excluded artifacts: `lib/i18n/strings.g.dart`, `build/**`, `*.g.dart` (see `analysis_options.yaml`).
- Keep web + phone parity for major sections/navigation (`home_web.dart` and `home_phone.dart` use matching section keys).
- When adding a new tracked external action, extend `LinkType`/`AnalyticsEvent` in `lib/data/repository/link_analytics_repository.dart` and route UI clicks through `LinkAnalyticsService`.
- If adding translatable text or image paths, update `*.i18n.json` files and regenerate localization (`dart run slang`).

