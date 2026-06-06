---
name: flutter-deploy
description: Phương pháp build & deploy hai_portfolio lên web (Vercel + Firebase). Dùng khi cần build web release, deploy production, phát hành thay đổi, bump version, hoặc kiểm tra quy trình release. Cũng dùng khi "deploy", "phát hành", "đưa lên Vercel", "build web", "release version mới".
---

# Flutter Deploy — Phương pháp

Skill định nghĩa CÁCH phát hành. Nguyên tắc: an toàn, có thể đảo ngược, xác nhận trước khi hướng ra ngoài.

## Tiền điều kiện (kiểm trước khi deploy)
1. `flutter-qa` đã PASS (không còn Blocker).
2. `make analyze` sạch.
3. Nếu là release thực: version đã bump trong `pubspec.yaml` (`version: x.y.z+n`).
4. i18n đã regen, không có file generated bị sửa tay.
5. **Được xác nhận phát hành** — `vercel --prod` là hành động hướng ngoại; xác nhận với người dùng/orchestrator trước, trừ khi đã uỷ quyền rõ ràng.

## Quy trình chuẩn
Dùng pipeline có sẵn (`make deploy` → `scripts/deploy.sh`):
```
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release
cd build/web && vercel --prod
```
- Firebase config: `firebase.json` (hosting/analytics). Nếu deploy Firebase Hosting thay vì Vercel, dùng `firebase deploy`.
- `vercel.json` đã cấu hình sẵn cho project.

## Quy trình thủ công từng bước (khi cần kiểm soát)
1. `make clean`
2. `make pub-get`
3. `fvm flutter build web --release` → kiểm `build/web/` có artifact.
4. Xác nhận phát hành → `cd build/web && vercel --prod`.
5. Mở URL trả về, xác minh trang load (không tuyên bố "đã deploy" khi chưa xác minh).

## Xử lý lỗi
- **Build fail:** dừng ngay, báo log, KHÔNG deploy artifact lỗi.
- **Deploy fail giữa chừng:** báo trạng thái thực (đã build? đã push?) để rollback. Vercel giữ deployment cũ → có thể promote lại bản trước.
- **Sai version:** dừng, bump `pubspec.yaml`, build lại.

## Định dạng output
File `_workspace/{NN}_deploy_{feature}.md`:
```
# Deploy: {Feature}
## Tiền điều kiện: QA PASS? analyze sạch? version bump?
## Lệnh đã chạy + kết quả build
## URL production + version
## Vấn đề / rollback (nếu có)
```

## Sau deploy
- Ghi version + URL vào báo cáo.
- Nếu có thay đổi đáng kể, nhắc cập nhật `CHANGELOG`/commit version bump.
- Báo orchestrator hoàn tất để thu thập feedback (Phase tiến hóa harness).
