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

