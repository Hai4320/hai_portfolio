---
name: flutter-feature-dev
description: Quy ước phát triển feature cho codebase hai_portfolio (Flutter web). Dùng khi thiết kế hoặc hiện thực bất kỳ feature/màn hình/widget nào trong dự án này — thêm model, repository, GetX controller, UI responsive web/phone, hoặc chuỗi i18n. Bắt buộc tham chiếu khi tạo/sửa code trong lib/. Cũng dùng khi "thêm tính năng", "sửa màn hình", "làm widget mới", "thêm chuỗi dịch".
---

# Flutter Feature Dev — Quy ước hai_portfolio

Skill này định nghĩa CÁCH viết feature đúng convention dự án. Đọc trước khi tạo/sửa code trong `lib/`.

## Kiến trúc tổng thể

```
lib/
├── data/
│   ├── model/        # model thuần Dart (copyWith, required named params)
│   ├── repository/   # nguồn dữ liệu tĩnh (XxxData) + Firestore repository
│   └── service/      # service nghiệp vụ (vd link_analytics_service)
├── ui/
│   ├── common/       # widget tái dùng (button, nav, badge, text_link...)
│   ├── screens/      # màn hình + controller GetX + widgets/ con
│   └── theme/        # app_colors, app_text_styles, app_theme
├── i18n/             # slang: *.i18n.json per locale → strings.g.dart
└── utils/            # tiện ích (constants, locale_controller, tenure...)
```

## Quy tắc bắt buộc

### 1. State — GetX
- Controller kế thừa `GetxController`. State reactive bằng `.obs` / `Rx<T>`, đọc qua `.value`.
- Đăng ký controller bằng `Get.put()` / `Get.lazyPut()`; lấy bằng `Get.find()`.
- **Không dùng** `setState` / `StatefulWidget` cho state nghiệp vụ — đó là vai trò của GetX ở đây.

### 2. Model — `lib/data/model/`
- Class thuần Dart, named params `required`, có `copyWith`. Xem `project.dart`, `experience.dart` làm mẫu.
- Không nhồi logic UI/network vào model.

### 3. Data — `lib/data/repository/`
- Dữ liệu tĩnh: class `XxxData` với `static final List<Model> xxx = [...]` (mẫu: `ProjectData`, `ExperienceData`).
- Firestore/Analytics: theo taxonomy enum sẵn có — `AnalyticsEvent`, `AnalyticsParams`, `LinkType` trong `link_analytics_repository.dart`. Thêm event/param mới vào enum này, KHÔNG rải string rời rạc.

### 4. i18n — slang (QUAN TRỌNG)
- Mọi chuỗi hiển thị qua slang, **không hardcode** trong widget.
- Thêm key vào CẢ 3 file: `lib/i18n/strings.i18n.json` (en, base) + `strings_vi.i18n.json` + `strings_ja.i18n.json`. Thiếu 1 locale là bug.
- Config: namespaces=true, key_case=camel, interpolation kiểu Dart (`$param`). Xem `slang.yaml`.
- Sau khi sửa JSON → regen: `dart run slang` hoặc `make gen-l10n`.
- **TUYỆT ĐỐI không sửa tay `strings.g.dart`** (generated). Truy cập chuỗi qua API generated của slang.

### 5. Responsive — web/phone
- Tách layout: pattern `home_web.dart` / `home_phone.dart` dưới `screens/.../widgets/`.
- Dùng `response_layout.dart` để chọn nhánh, `flutter_screenutil` cho kích thước co giãn.
- Mọi feature UI phải xử lý CẢ HAI nhánh, không chỉ web.

### 6. Theme
- Màu qua `app_colors.dart`, typography qua `app_text_styles.dart` + `google_fonts`. Không hardcode màu/size rời rạc.

## Tái sử dụng trước khi tạo mới
Trước khi viết widget mới, rà `lib/ui/common/`: `primary_button`, `text_link`, `image_link`, `skill_badge`, `floating_nav`, `response_layout`, `firework_click_effect`... Nhiều thứ đã có sẵn.

## Tooling (dự án dùng fvm)
| Việc | Lệnh |
|------|------|
| Format | `make format` (dart format line-length 120, loại trừ `*.g.dart`) |
| Analyze/lint | `make analyze` / `make lint` (`flutter analyze`) |
| Auto-fix | `make fix` (`dart fix --apply`) |
| Regen i18n | `make gen-l10n` (`dart run slang`) |
| Code-gen khác | `make build-runner` |
| Test | `make test` |
| Chạy Flutter | luôn qua `fvm flutter ...` |

## Quy trình hiện thực một feature
1. Đọc thiết kế của architect (file `_workspace/*_architect_*.md`).
2. Model → repository/service → controller (GetX) → UI (web + phone) → theme.
3. Thêm key i18n cho cả 3 locale → `make gen-l10n`.
4. `make format` → `make analyze`.
5. Bàn giao module cho `flutter-qa` (incremental), không đợi xong toàn bộ.

> Chi tiết mẫu code & checklist đầy đủ: `references/codebase-conventions.md`.
