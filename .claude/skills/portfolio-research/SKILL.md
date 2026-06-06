---
name: portfolio-research
description: Phương pháp nghiên cứu & đánh giá khả thi feature cho portfolio Flutter web (hai_portfolio). Dùng khi cần khảo sát công nghệ/API/thư viện, so sánh phương án tích hợp (vd Spotify, AI, career-ops), đánh giá feasibility trên Flutter web + Vercel + Firebase, hoặc đề xuất roadmap trước khi code. Cũng dùng khi "research feature", "có làm được không", "nên dùng thư viện nào", "đánh giá tính khả thi".
---

# Portfolio Research — Phương pháp

Skill định nghĩa CÁCH nghiên cứu một feature trước khi xây, để kết quả có căn cứ và bám ràng buộc thực tế dự án.

## Ràng buộc cố định của dự án (luôn cân nhắc)
- **Flutter WEB** là target chính (deploy Vercel). Một giải pháp chỉ chạy native mobile là điểm trừ lớn.
- **CORS / cần backend:** nhiều API (vd Spotify) cần OAuth + server-side token exchange — trên web tĩnh điều này là rào cản lớn. Luôn kiểm tra điểm này SỚM.
- Stack hiện có: GetX, Firebase (analytics/firestore), slang i18n. Ưu tiên giải pháp hòa hợp.
- Là portfolio cá nhân: ưu tiên chi phí thấp/free tier, không cần hạ tầng nặng.

## Quy trình nghiên cứu
1. **Làm rõ phạm vi:** feature giải quyết gì, scope tối thiểu (MVP) là gì.
2. **Liệt kê phương án** (≥2 khi có lựa chọn): thư viện pub.dev / REST API / SDK JS nhúng / dịch vụ bên thứ ba.
3. **Kiểm tra web-support & auth cho từng phương án** — đây là bộ lọc quyết định:
   - Có chạy trên Flutter web không? (kiểm tra platform support trên pub.dev)
   - Auth cần gì? OAuth redirect / cần backend / API key lộ ở client?
   - CORS có chặn không?
   - Quota/free tier?
4. **Falsify:** với phương án có vẻ tốt nhất, chủ động tìm lý do nó hỏng trên web tĩnh.
5. **Đề xuất kiến trúc cấp cao:** model/repository/service nào cần thêm, điểm tích hợp.
6. **Roadmap + độ phức tạp:** chia bước, ước lượng (S/M/L).

## Tiêu chuẩn căn cứ
- Mọi tuyên bố then chốt về API/thư viện phải kèm nguồn (URL pub.dev / docs chính thức).
- Phân loại nguồn: tài liệu chính thức > repo/issue > blog. Nguồn mâu thuẫn → giữ cả hai, ghi xuất xứ.
- Kết luận feasibility rõ ràng: **Khả thi / Khả thi có điều kiện (nêu điều kiện) / Không khuyến nghị (nêu lý do)**.

## Định dạng output
File `_workspace/{NN}_researcher_{feature}.md`:
```
# Research: {Feature}
## Kết luận feasibility: {Khả thi / Có điều kiện / Không khuyến nghị}
## Bối cảnh & scope MVP
## Bảng so sánh phương án
| Phương án | Web support | Auth/CORS | Chi phí | Rủi ro | Đánh giá |
## Ràng buộc kỹ thuật (Flutter web + Vercel + Firebase)
## Kiến trúc đề xuất (model/repository/service)
## Roadmap (bước + độ phức tạp S/M/L)
## Nguồn (URLs)
```

## Lưu ý
Nếu phát hiện feature bất khả thi trên web tĩnh (vd cần backend OAuth không có sẵn), nêu rõ NGAY ở đầu báo cáo và đề xuất phương án thay thế (vd nhúng widget công khai, dữ liệu tĩnh, hoặc hoãn).
