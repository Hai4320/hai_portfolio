# Codebase Conventions — hai_portfolio (chi tiết)

Tham chiếu sâu cho `flutter-feature-dev`. Đọc khi cần mẫu code cụ thể.

## Mục lục
1. Mẫu Model
2. Mẫu Repository tĩnh
3. Mẫu GetX Controller
4. Mẫu i18n (slang)
5. Mẫu Analytics
6. Checklist hoàn thành feature

---

## 1. Mẫu Model
```dart
class Project {
  final String name;
  final List<String> tech;
  final String description;
  final String link;

  Project({required this.name, required this.tech, required this.description, required this.link});

  Project copyWith({String? name, List<String>? tech, String? description, String? link}) {
    return Project(
      name: name ?? this.name,
      tech: tech ?? this.tech,
      description: description ?? this.description,
      link: link ?? this.link,
    );
  }
}
```
Nguyên tắc: named params `required`, `final` fields, `copyWith` đầy đủ. Không logic UI/network.

## 2. Mẫu Repository tĩnh
```dart
class ProjectData {
  static final List<Project> projects = [
    Project(name: '...', tech: ['Flutter'], description: '...', link: '...'),
  ];
}
```
Dữ liệu hiển thị tĩnh để dạng `XxxData` với `static final List<...>`.

## 3. Mẫu GetX Controller
```dart
class HomeController extends GetxController {
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  void switchTheme() {
    currentTheme.value =
        currentTheme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
```
- State reactive: `.obs`, đọc/ghi qua `.value`.
- Trong widget: `Obx(() => ...)` hoặc `GetX<Controller>` để rebuild theo state.
- Đăng ký: `Get.put(HomeController())` hoặc `Get.lazyPut(() => HomeController())`.

## 4. Mẫu i18n (slang)
File JSON namespaced, base = en. Khi thêm key `myFeature.title`:

`strings.i18n.json` (en):
```json
{ "myFeature": { "title": "My Title", "greeting": "Hi $name" } }
```
`strings_vi.i18n.json`:
```json
{ "myFeature": { "title": "Tiêu đề", "greeting": "Chào $name" } }
```
`strings_ja.i18n.json`:
```json
{ "myFeature": { "title": "タイトル", "greeting": "こんにちは $name" } }
```
Rồi: `make gen-l10n` (== `fvm dart run slang`). Truy cập qua API generated của slang (`t.myFeature.title`). KHÔNG sửa `strings.g.dart`.

Config liên quan (`slang.yaml`): `base_locale: en`, `fallback_strategy: base_locale`, `namespaces: true`, `key_case: camel`, `string_interpolation: dart`.

## 5. Mẫu Analytics
Thêm event/param vào enum sẵn có, không tạo string rời:
```dart
enum AnalyticsEvent {
  linkClick('link_click'),
  // ... thêm event mới ở đây:
  spotifyPlay('spotify_play');
  const AnalyticsEvent(this.name);
  final String name;
}
```
Param keys tập trung trong `class AnalyticsParams`. `LinkType` enum cho loại link.

## 6. Checklist hoàn thành feature
- [ ] Model có `copyWith`, `final`, named `required`
- [ ] Dữ liệu tĩnh ở `XxxData` / Firestore theo repository pattern
- [ ] Controller GetX reactive, đăng ký đúng cách
- [ ] UI xử lý CẢ web và phone (response_layout + screenutil)
- [ ] Tái dùng widget `ui/common/` thay vì viết lại
- [ ] Màu/typography qua `app_colors` / `app_text_styles`
- [ ] Chuỗi i18n thêm đủ en + vi + ja
- [ ] Đã chạy `make gen-l10n` (regen strings.g.dart)
- [ ] `strings.g.dart` KHÔNG bị sửa tay
- [ ] `make format` sạch
- [ ] `make analyze` không lỗi
- [ ] Bàn giao QA từng module (incremental)
