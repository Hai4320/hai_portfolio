# hai_portfolio

Flutter web portfolio. Stack: GetX (state) · Firebase (analytics/firestore) · slang (i18n) · flutter_screenutil (responsive) · fvm. Deploy: Vercel + Firebase. Lệnh qua `Makefile` (chạy Flutter bằng `fvm flutter`).

## Harness: Phát triển feature portfolio (full lifecycle)

**Mục tiêu:** Điều phối team agent xây feature end-to-end — research → thiết kế → code → QA → deploy — bám đúng convention của codebase.

**Trigger:** Khi có yêu cầu xây/thêm/sửa feature, triển khai issue, hoặc công việc nhiều bước trên codebase này (kể cả yêu cầu hậu kỳ: chạy lại, cập nhật, sửa một phần), hãy dùng skill `portfolio-orchestrator`. Câu hỏi đơn giản thì trả lời trực tiếp.

**Thành phần:** 5 agent (`.claude/agents/`) + 5 skill (`.claude/skills/`). Orchestrator quản lý danh sách chi tiết — không liệt kê lại ở đây.

**Nhật ký thay đổi (Changelog):**
| Ngày | Thay đổi | Đối tượng | Lý do |
|------|----------|-----------|-------|
| 2026-06-06 | Khởi tạo harness full-lifecycle (5 agent + 5 skill, hybrid mode) | Toàn bộ | - |
