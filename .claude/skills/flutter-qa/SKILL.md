---
name: flutter-qa
description: Phương pháp QA cho thay đổi trong hai_portfolio — chạy analyze/lint/test, kiểm i18n đủ 3 locale (en/vi/ja), đối chiếu shape cross-boundary giữa model↔repository↔controller↔UI, xác minh responsive web/phone. Dùng khi cần kiểm thử/verify/review chất lượng code Flutter, "kiểm tra trước khi merge", "QA feature", "chạy test/lint", hoặc khi developer báo xong một module.
---

# Flutter QA — Phương pháp

Skill định nghĩa CÁCH kiểm thử chất lượng. Trọng tâm: bắt **bug ở biên giới giữa các layer**, không chỉ kiểm "có tồn tại".

## Nguyên tắc cốt lõi
- **Chạy thật, báo thật.** Không suy đoán PASS. Test fail → nói fail kèm log. Bước bị bỏ → nói rõ đã bỏ.
- **QA tăng dần (incremental):** verify ngay sau mỗi module developer hoàn thành, không gộp 1 lần cuối — bug biên phát hiện sớm rẻ hơn nhiều.
- **Cross-boundary là số 1:** đọc đồng thời hai đầu của một contract và so field/kiểu/null-safety.

## Quy trình QA
### 1. Static analysis
```
make analyze      # dart analyze
make lint         # flutter analyze
make format       # kiểm format sạch (line-length 120)
```
Có lỗi analyzer = chưa PASS.

### 2. Cross-boundary check (quan trọng nhất)
Đọc đồng thời và so sánh shape:
- **Model ↔ Repository:** field model có khớp dữ liệu repository khởi tạo? (thiếu field, sai kiểu)
- **Repository ↔ Controller:** controller đọc đúng tên/kiểu field? null-safety?
- **Controller ↔ UI:** widget bind đúng `Rx`/`.value`? `Obx` bọc đúng vùng reactive?
- **Firestore/Analytics:** event/param dùng đúng enum taxonomy (`AnalyticsEvent`/`AnalyticsParams`)?

### 3. i18n check
- Mọi key mới tồn tại ở CẢ `strings.i18n.json` (en) + `strings_vi.i18n.json` + `strings_ja.i18n.json`. Thiếu 1 locale = bug.
- `strings.g.dart` đã được regen (so với JSON) và KHÔNG bị sửa tay.
- Không còn chuỗi UI hardcode (grep nhanh chuỗi tiếng Việt/Anh literal trong widget mới).

### 4. Responsive check
- Feature xử lý cả nhánh `*_web.dart` và `*_phone.dart`, không chỉ một.
- Dùng `response_layout` / `screenutil` thay vì kích thước cứng.

### 5. Test
```
make test         # flutter test
```

## Phân loại bug
- **Blocker:** lỗi compile/analyze, crash, thiếu locale, sai shape cross-boundary.
- **Major:** responsive gãy 1 nhánh, hardcode chuỗi, sai taxonomy analytics.
- **Minor:** style/format, đặt tên, lặp code.

## Định dạng output
File `_workspace/{NN}_qa_{feature}.md`:
```
# QA: {Feature} — {PASS / FAIL}
## Lệnh đã chạy + kết quả (analyze/lint/test)
## Cross-boundary findings
## i18n findings (en/vi/ja)
## Responsive findings (web/phone)
## Bug list (Blocker/Major/Minor + file:line)
## Kết luận: gate deploy = PASS / FAIL
```

## Cổng deploy
QA là cổng chặn: chỉ khi không còn Blocker (và Major đã xử lý hoặc được chấp nhận) thì mới mở đường cho `deploy-engineer`. Không tự sửa code trừ khi được yêu cầu — báo developer fix rồi re-test vùng đã đổi.
