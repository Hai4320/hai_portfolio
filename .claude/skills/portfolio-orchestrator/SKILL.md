---
name: portfolio-orchestrator
description: Điều phối toàn bộ vòng đời phát triển feature cho portfolio Flutter hai_portfolio — research → thiết kế → code → QA → deploy. Dùng khi người dùng yêu cầu xây/thêm/sửa một feature của portfolio (vd Spotify #5, AI #10, list apps #24, career-ops #30), triển khai một issue, hoặc bất kỳ công việc nhiều bước nào trên codebase này. Cũng kích hoạt với: "làm feature X", "triển khai issue", "thêm tính năng", "research rồi làm", "deploy thay đổi", và các yêu cầu hậu kỳ: "chạy lại", "cập nhật", "sửa lại phần X", "cải thiện kết quả", "làm tiếp", "dựa trên kết quả trước". Câu hỏi đơn giản thì trả lời trực tiếp, không cần kích hoạt.
---

# Portfolio Orchestrator — Điều phối lifecycle

Điều phối team agent xây feature cho hai_portfolio theo mô hình **HYBRID** (mỗi phase một execution mode). Bạn là leader: lập kế hoạch, tạo team, giao việc, thu kết quả, tổng hợp.

## Đội ngũ (xem `.claude/agents/`)
| Agent | Vai trò | Skill | Type |
|-------|---------|-------|------|
| `portfolio-researcher` | Research + feasibility | portfolio-research | general-purpose |
| `flutter-architect` | Thiết kế thực thi | flutter-feature-dev | general-purpose |
| `flutter-developer` | Hiện thực code | flutter-feature-dev | general-purpose |
| `flutter-qa` | QA cross-boundary | flutter-qa | general-purpose |
| `deploy-engineer` | Build & deploy | flutter-deploy | general-purpose |

**Mọi lời gọi Agent dùng `model: "opus"`.**

## Phase 0: Kiểm tra ngữ cảnh (BẮT BUỘC chạy đầu tiên)
Xác định chế độ thực thi dựa trên `_workspace/`:
- **`_workspace/` chưa tồn tại** → **chạy mới hoàn toàn** từ Phase 1.
- **`_workspace/` có sẵn + người dùng yêu cầu sửa một phần** ("sửa lại UI", "research lại auth") → **chạy lại từng phần**: chỉ gọi agent liên quan, đọc file `_workspace/` cũ làm input.
- **`_workspace/` có sẵn + input/feature mới** → di chuyển `_workspace/` → `_workspace_prev/`, rồi chạy mới.

Quy ước file: `_workspace/{NN}_{agent}_{feature}.{ext}` (vd `01_researcher_spotify.md`). Chỉ artifact cuối ra `lib/`; file trung gian `_workspace/` được giữ lại để audit.

## Quy mô & cắt phase
Không phải mọi yêu cầu cần đủ 4 phase. Cân nhắc:
- Feature mới chưa rõ khả thi (Spotify/AI) → **đủ lifecycle** (research → ... → deploy).
- Sửa UI/nội dung nhỏ, đã rõ cách làm → **bỏ research**, vào thẳng architect/developer.
- Chỉ deploy → chỉ gọi `deploy-engineer`.
- Chỉ review → chỉ gọi `flutter-qa`.

## Luồng HYBRID

### Phase 1 — Research (mode: SUB-AGENT, fan-out)
Khi feature chưa rõ khả thi. Gọi `portfolio-researcher` (có thể fan-out nhiều sub-agent song song bằng `run_in_background: true` nếu cần khảo sát nhiều góc: API, thư viện, auth/web-support). Tổng hợp kết quả → `_workspace/01_researcher_{feature}.md`.
> Nếu research kết luận **không khả thi trên web** → dừng pipeline, báo người dùng kèm phương án thay thế. KHÔNG chuyển sang code.

### Phase 2 — Thiết kế + Hiện thực + QA (mode: AGENT TEAM)
Tạo team bằng `TeamCreate` gồm `flutter-architect`, `flutter-developer`, `flutter-qa`. Giao việc bằng `TaskCreate` với phụ thuộc:
```
[Leader/Orchestrator]
  ├── TeamCreate(members: architect, developer, qa)
  ├── TaskCreate: architect thiết kế (input: research) → 02_architect_{feature}.md
  ├── TaskCreate: developer hiện thực (dep: thiết kế) → code + 03_developer_{feature}.md
  ├── TaskCreate: qa verify TỪNG module (incremental, dep: developer) → 04_qa_{feature}.md
  ├── Producer-Reviewer: developer ↔ qa lặp qua SendMessage tới khi QA PASS
  └── Thu kết quả, dọn team
```
- Pattern: **Pipeline** (architect→developer) lồng **Producer-Reviewer** (developer↔qa).
- Developer báo QA ngay mỗi module xong (incremental), không đợi xong hết.
- QA PASS (không Blocker) là điều kiện mở cổng Phase 3.

### Phase 3 — Deploy (mode: SUB-AGENT)
Sau khi QA PASS **và người dùng xác nhận phát hành**, gọi `deploy-engineer`. `vercel --prod` là hành động hướng ngoại → luôn xác nhận trước.
→ `_workspace/05_deploy_{feature}.md`.

## Giao thức truyền dữ liệu
- **Task-based** (`TaskCreate`/`TaskUpdate`): theo dõi tiến độ + phụ thuộc trong team.
- **File-based** (`_workspace/`): artifact giữa các phase (research→thiết kế→QA report).
- **Message-based** (`SendMessage`): vòng lặp developer↔qa realtime.
- **Return-value**: kết quả sub-agent (researcher, deploy) thu về leader.
- Chuyển phase team→sub: lưu artifact ra file trước khi dọn team.

## Xử lý lỗi
- Agent fail → retry 1 lần. Vẫn fail → tiếp tục không có kết quả đó, **ghi rõ phần thiếu** trong báo cáo, không giả vờ hoàn tất.
- Dữ liệu mâu thuẫn (vd 2 nguồn research) → giữ cả hai, ghi xuất xứ, không tự xoá.
- QA FAIL lặp >2 vòng cùng lỗi → dừng, báo người dùng để quyết định thay vì lặp vô hạn.

## Phase tiến hóa (sau mỗi lần chạy)
Hỏi người dùng: "Kết quả có gì cần cải thiện? Cấu trúc team/workflow muốn đổi gì không?" Phản hồi → cập nhật agent/skill tương ứng + ghi vào **变更 이력** của `CLAUDE.md` (mục Harness). Không ép buộc, nhưng luôn mở cơ hội.

## Test scenarios
**Luồng bình thường:** "Triển khai Spotify integration (#5)" → Phase 0 (mới) → Phase 1 research (phát hiện cần OAuth backend → có điều kiện) → Phase 2 team thiết kế giải pháp nhúng widget public + code + QA → Phase 3 xác nhận → deploy. Kết quả: feature chạy + báo cáo `_workspace/`.

**Luồng hậu kỳ:** "Sửa lại phần UI Spotify cho mobile" → Phase 0 phát hiện `_workspace/` có sẵn + yêu cầu sửa một phần → chạy lại từng phần: chỉ architect (điều chỉnh responsive) + developer + qa, bỏ research/deploy tới khi PASS.

**Luồng lỗi:** research kết luận feature cần backend không có sẵn → dừng sau Phase 1, báo người dùng + đề xuất thay thế, không vào Phase 2.
