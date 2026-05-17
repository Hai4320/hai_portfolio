# Portfolio Improvement Plan

> **Phạm vi**: Nâng cấp portfolio Flutter web (repo `hai_portfolio`)
> **Trọng tâm**: Nội dung & ấn tượng đầu tiên
> **Ngày tạo**: 2026-05-17
> **Người thực hiện**: Ho Duc Hai

---

## Quyết định thiết kế đã chốt

| Khía cạnh | Lựa chọn |
|-----------|----------|
| Hạng mục ưu tiên | (1) About / Experience timeline · (2) SEO & Web meta tags |
| Phạm vi UI | Tinh chỉnh nhẹ — giữ tone dark + periwinkle + Poppins |
| Data source | Hardcoded trong code (giống `project_data.dart` hiện tại) |
| Đa ngôn ngữ | Giữ 3 locale: EN / JA / VI |
| Branching | Làm trên branch riêng `feature/about-experience-seo`, merge khi xong |

---

## Hạng mục 1 — About / Experience Timeline

### 1.1. Hiện trạng

- Section experience hiện tại ở [lib/ui/screens/home/widgets/home_web.dart#L270-L296](lib/ui/screens/home/widgets/home_web.dart#L270-L296) chỉ là **1 paragraph + emoji** `(~_^)`.
- Không có timeline công ty, không có học vấn, không có quick facts.
- Floating nav đã có entry "Experience" ([home_web.dart#L433](lib/ui/screens/home/widgets/home_web.dart#L433)) — sẽ giữ và bổ sung "About" nếu cần.

### 1.2. Mục tiêu

- Thể hiện chiều sâu kinh nghiệm: ai, ở đâu, làm gì, đạt được gì.
- Có timeline visual rõ ràng theo thứ tự thời gian.
- Có thẻ About với bio ngắn + quick facts (location, languages, years of exp, current role).
- Responsive: web hiển thị 2 cột (timeline trái + about phải), mobile stack dọc.

### 1.3. Data models mới

#### `lib/data/model/experience.dart`

```dart
class Experience {
  final String company;
  final String role;
  final String location;        // VD: "Hanoi, Vietnam"
  final String startDate;        // VD: "2023-03"
  final String? endDate;          // null = present
  final String description;
  final List<String> achievements;
  final List<String> techStack;
  final String? logoAsset;        // optional company logo
  final String? companyUrl;
}
```

#### `lib/data/model/education.dart`

```dart
class Education {
  final String school;
  final String degree;
  final String startYear;
  final String endYear;
  final String? description;
}
```

#### `lib/data/model/about_info.dart`

```dart
class AboutInfo {
  final String bio;            // 2-3 câu giới thiệu
  final String location;
  final List<String> languages; // VD: ["Vietnamese (native)", "English (B2)", "Japanese (N3)"]
  final DateTime careerStartDate; // VD: DateTime(2022, 3) — dùng để tính years of exp dynamic
  final String currentRole;
}
```

> **Note**: `yearsOfExperience` được tính dynamic trong widget bằng
> `DateTime.now().difference(careerStartDate).inDays ~/ 365` (hoặc tốt hơn là so
> sánh `year`/`month` để chính xác hơn). Không hardcode `int` để khỏi phải sửa
> hàng năm.

### 1.4. Hardcoded data files

#### `lib/data/repository/experience_data.dart`

Pattern y hệt [project_data.dart](lib/data/repository/project_data.dart). Placeholder để bạn điền sau:

```dart
class ExperienceData {
  static List<Experience> experiences = [
    Experience(
      company: 'Sun*',
      role: 'Mobile Engineer — Growth Team',
      location: 'Hanoi, Vietnam',
      startDate: '2023-XX',
      endDate: null,
      description: '...',
      achievements: ['...', '...'],
      techStack: ['Flutter', 'Dart', 'Firebase', '...'],
    ),
    // TODO: thêm các vị trí trước đó
  ];

  static List<Education> educations = [
    // TODO: trường, ngành, năm
  ];

  static AboutInfo about = AboutInfo(
    bio: 'TODO',
    location: 'Hanoi, Vietnam',
    languages: ['Vietnamese (native)', 'English', 'Japanese'],
    careerStartDate: DateTime(2022, 3), // TODO: điền start date thực
    currentRole: 'Mobile Engineer at Sun*',
  );
}
```

### 1.5. Widgets mới

| File | Mô tả |
|------|-------|
| `lib/ui/common/experience_timeline_item.dart` | 1 item timeline: chấm tròn periwinkle + đường nối dọc + card nội dung (company, role, period, achievements list) |
| `lib/ui/common/about_card.dart` | Card giới thiệu: bio + grid quick facts (location · years · languages · current role) |
| `lib/ui/common/education_item.dart` | Item học vấn nhỏ gọn (school, degree, period) |
| `lib/ui/common/section_title.dart` | (Tùy chọn) Tách title pattern dùng chung — hiện đang lặp `Text(...).gradient()` nhiều lần |

**Style chốt**:
- Timeline dot: `Container` 12×12, `AppColors.lightPeriwinkle`, viền outer 24×24 với opacity 0.3.
- Đường nối: `Container` width 2, color `AppColors.lightPeriwinkle.withOpacity(0.4)`.
- Card content: nền `AppColors.richBlack`, border 1px periwinkle 30%, padding 24, border-radius 8.
- Animation reveal: `AnimatedOpacity` + `AnimatedSlide` khi scroll vào viewport (dùng `VisibilityDetector` package hoặc tự cài).

### 1.6. Sửa `home_web.dart` & `home_phone.dart`

**Vị trí**: thay block [home_web.dart#L270-L296](lib/ui/screens/home/widgets/home_web.dart#L270-L296).

```
SizedBox(height: sectionSpace),
Container(
  key: _experienceKey,
  width: double.infinity,
  decoration: BoxDecoration(color: AppColors.richBlack),
  padding: EdgeInsets.symmetric(vertical: 160.h, horizontal: contentPadding),
  child: Column(
    children: [
      Text(t.strings.home.experience.title, ...).gradient(),
      SizedBox(height: 60.h),
      Row( // web layout
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: _TimelineColumn()),
          SizedBox(width: 80.w),
          Expanded(flex: 4, child: _AboutColumn()),
        ],
      ),
    ],
  ),
),
```

Mobile (`home_phone.dart`): stack dọc — About trên, timeline dưới.

### 1.7. i18n bổ sung

> ⚠️ **Breaking change cần chú ý**: `home.experience` hiện tại đã có 3 keys
> (`title`, `emoji`, `description`) được dùng ở
> [home_web.dart:282](lib/ui/screens/home/widgets/home_web.dart#L282) và
> [home_web.dart:289](lib/ui/screens/home/widgets/home_web.dart#L289). Khi
> refactor sang timeline mới, **toàn bộ block đó được thay thế** → 2 keys
> `emoji` và `description` không còn ai dùng. Khi sửa code phải:
> 1. Xóa reference cũ tới `t.strings.home.experience.emoji` và `.description` trong `home_web.dart` & `home_phone.dart`.
> 2. Xóa keys đó khỏi cả 3 file `strings*.i18n.json`.
> 3. Regenerate `strings.g.dart` bằng `dart run slang`.
> Nếu không, build sẽ pass (key bị thừa không gây lỗi) nhưng plan sẽ không sạch.

**Merge vào** `lib/i18n/strings.i18n.json`, `strings_ja.i18n.json`, `strings_vi.i18n.json` (thay block `home.experience` cũ, **thêm mới** block `home.about`):

```json
{
  "home": {
    "about": {
      "title": "About me",
      "bioLabel": "Bio",
      "facts": {
        "location": "Location",
        "yearsExp": "Years of experience",
        "languages": "Languages",
        "currentRole": "Current role"
      }
    },
    "experience": {
      "title": "Experience",
      "timelineTitle": "Career timeline",
      "educationTitle": "Education",
      "present": "Present",
      "achievementsLabel": "Highlights",
      "techStackLabel": "Tech stack"
    }
  }
}
```

> Metadata công ty/trường giữ trong data file (tiếng Anh). Nếu sau này muốn dịch metadata, có thể nâng cấp model dùng `Map<String, String>` cho từng field.

### 1.8. Cập nhật floating nav

[home_web.dart#L429-L437](lib/ui/screens/home/widgets/home_web.dart#L429-L437) — giữ nguyên 5 items (Home/Skills/Experience/Projects/Contact). Không thêm "About" riêng để tránh nav quá dài; About nằm trong section Experience.

---

## Hạng mục 2 — SEO & Web Meta Tags

### 2.1. Hiện trạng

[web/index.html](web/index.html):
- `<title>hai_portfolio</title>` — không hấp dẫn
- `<meta name="description" content="A new Flutter project.">` — placeholder
- Không có Open Graph, Twitter Card, JSON-LD, hreflang, canonical
- Không có `robots.txt`, `sitemap.xml`
- [web/manifest.json](web/manifest.json) cần review tên/mô tả

### 2.2. Mục tiêu

- Title & description hấp dẫn, SEO-friendly.
- Link share lên LinkedIn / Twitter / Facebook hiển thị card đẹp (OG image + title + desc).
- Google index 3 locale với `hreflang`.
- Có structured data (`schema.org/Person`) để Google hiển thị rich result.

### 2.3. Thay đổi `web/index.html`

#### a) Title & description

```html
<title>Hai Ho — Mobile Developer | Flutter Engineer</title>
<meta name="description" content="Hai Ho — Mobile engineer with 3+ years building Flutter & native apps for Japanese and Vietnamese clients. Currently growth team @ Sun*.">
<meta name="keywords" content="Hai Ho, Hai4320, Flutter developer, Mobile engineer Vietnam, Dart, iOS, Android, portfolio">
<meta name="author" content="Ho Duc Hai">
<meta name="theme-color" content="#111111">
<link rel="canonical" href="https://YOUR_DOMAIN/">
```

> **TODO**: thay `YOUR_DOMAIN` bằng domain thật (sẽ check `vercel.json` & `firebase.json` để xác định domain hiện tại).

#### b) Open Graph

```html
<meta property="og:type" content="website">
<meta property="og:url" content="https://YOUR_DOMAIN/">
<meta property="og:title" content="Hai Ho — Mobile Developer">
<meta property="og:description" content="...">
<meta property="og:image" content="https://YOUR_DOMAIN/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:locale" content="en_US">
<meta property="og:locale:alternate" content="ja_JP">
<meta property="og:locale:alternate" content="vi_VN">
<meta property="og:site_name" content="Hai Ho Portfolio">
```

#### c) Twitter Card

```html
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Hai Ho — Mobile Developer">
<meta name="twitter:description" content="...">
<meta name="twitter:image" content="https://YOUR_DOMAIN/og-image.png">
```

#### d) Hreflang (cho 3 ngôn ngữ)

```html
<link rel="alternate" hreflang="en" href="https://YOUR_DOMAIN/?lang=en">
<link rel="alternate" hreflang="ja" href="https://YOUR_DOMAIN/?lang=ja">
<link rel="alternate" hreflang="vi" href="https://YOUR_DOMAIN/?lang=vi">
<link rel="alternate" hreflang="x-default" href="https://YOUR_DOMAIN/">
```

#### e) JSON-LD structured data (Person schema)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Ho Duc Hai",
  "alternateName": "Hai Ho",
  "jobTitle": "Mobile Engineer",
  "worksFor": { "@type": "Organization", "name": "Sun*" },
  "url": "https://YOUR_DOMAIN/",
  "sameAs": [
    "https://github.com/Hai4320",
    "https://www.linkedin.com/in/hai4320"
  ],
  "knowsAbout": ["Flutter", "Dart", "Mobile Development", "iOS", "Android"],
  "address": { "@type": "PostalAddress", "addressLocality": "Hanoi", "addressCountry": "VN" }
}
</script>
```

#### f) Pre-render fallback cho crawler

Bên trong `<body>` thêm `<noscript>` nhỏ cho bot không chạy JS:

```html
<noscript>
  <h1>Hai Ho — Mobile Developer</h1>
  <p>Portfolio of Hai Ho, mobile engineer with 3+ years building Flutter and native apps.
     Currently working at Sun* on the growth team.</p>
  <p>Find me on <a href="https://github.com/Hai4320">GitHub</a> and
     <a href="https://www.linkedin.com/in/hai4320">LinkedIn</a>.</p>
</noscript>
```

### 2.4. File mới

#### `web/robots.txt`

```
User-agent: *
Allow: /

Sitemap: https://YOUR_DOMAIN/sitemap.xml
```

#### `web/sitemap.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <url>
    <loc>https://YOUR_DOMAIN/</loc>
    <xhtml:link rel="alternate" hreflang="en" href="https://YOUR_DOMAIN/?lang=en"/>
    <xhtml:link rel="alternate" hreflang="ja" href="https://YOUR_DOMAIN/?lang=ja"/>
    <xhtml:link rel="alternate" hreflang="vi" href="https://YOUR_DOMAIN/?lang=vi"/>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
```

#### `web/og-image.png`

**TODO**: Tạo ảnh 1200×630, tone dark `#111111`, có:
- Tên lớn: "HAI HO" (Poppins Black)
- Tagline: "Mobile Developer"
- Subtle gradient text (giống style trong app)
- Avatar nhỏ góc phải

> Có thể dùng Figma template hoặc tool như [https://og-playground.vercel.app](https://og-playground.vercel.app). Lưu vào `web/og-image.png`.

### 2.5. Cập nhật `web/manifest.json`

```json
{
  "name": "Hai Ho — Mobile Developer",
  "short_name": "Hai Ho",
  "description": "Portfolio of Hai Ho, mobile engineer specializing in Flutter and native development.",
  "start_url": ".",
  "display": "standalone",
  "background_color": "#111111",
  "theme_color": "#111111",
  "orientation": "portrait-primary",
  "prefer_related_applications": false
}
```

### 2.6. Verify deploy routes

- [vercel.json](vercel.json) — đảm bảo `robots.txt`, `sitemap.xml`, `og-image.png` được serve đúng (không bị Flutter rewrite).
- [firebase.json](firebase.json) — same check cho Firebase Hosting.

---

## Lộ trình thực thi

| # | Tasks | Files chính | Ước lượng |
|---|-------|-------------|-----------|
| 1 | Tạo data models (Experience, Education, AboutInfo) | `lib/data/model/experience.dart`, `education.dart`, `about_info.dart` | 15' |
| 2 | Tạo `experience_data.dart` với placeholder | `lib/data/repository/experience_data.dart` | 10' |
| 3 | Tạo widget `experience_timeline_item.dart` | `lib/ui/common/experience_timeline_item.dart` | 25' |
| 4 | Tạo widget `about_card.dart` + `education_item.dart` | `lib/ui/common/about_card.dart`, `education_item.dart` | 20' |
| 5 | Refactor experience section trong `home_web.dart` | `lib/ui/screens/home/widgets/home_web.dart` | 20' |
| 6 | Refactor experience section trong `home_phone.dart` | `lib/ui/screens/home/widgets/home_phone.dart` | 15' |
| 7 | Bổ sung i18n EN/JA/VI + regenerate strings.g.dart | `lib/i18n/*.i18n.json` | 20' |
| 8 | Cập nhật `web/index.html` (title, meta, OG, Twitter, JSON-LD, hreflang) | `web/index.html` | 20' |
| 9 | Tạo `web/robots.txt` + `web/sitemap.xml` | new files | 5' |
| 10 | Cập nhật `web/manifest.json` | `web/manifest.json` | 5' |
| 11 | Tạo `web/og-image.png` (1200×630) | new file | 15-30' (tùy design) |
| 12 | Verify `vercel.json` & `firebase.json` route đúng cho file mới | configs | 10' |
| 13 | Build web + test responsive + verify share preview | — | 20' |

**Tổng**: ~3-3.5 giờ làm việc.

---

## Trước khi code — cần input từ bạn (có thể trả lời sau)

### Cho hạng mục 1 (Experience)

1. **Danh sách công ty / role**:
   - Hiện tại: Sun* — Mobile Engineer (Growth Team) — từ tháng/năm nào?
   - Các vị trí trước đó (nếu có): công ty, role, period?

2. **Học vấn**:
   - Trường, ngành, năm tốt nghiệp?

3. **About bio** (2-3 câu):
   - Tone: formal (LinkedIn-style) hay friendly (casual)?
   - Có muốn highlight thông tin đặc biệt nào không? VD: chứng chỉ JLPT, AWS, mentor, speaker...

4. **Languages proficiency**:
   - Vietnamese (native), English (?), Japanese (?)

### Cho hạng mục 2 (SEO)

1. **Domain hiện tại của portfolio**? (để điền vào canonical, OG URL, sitemap)
2. Có sẵn ảnh OG (1200×630) chưa? Nếu không, tôi sẽ tạo placeholder bằng Flutter widget rồi screenshot, hoặc bạn tự design trên Figma/Canva.

> Không có input — vẫn code được với placeholder `TODO`, bạn điền sau.

---

## Tiêu chí "hoàn thành"

### Hạng mục 1
- [ ] Section Experience có timeline ≥ 1 entry (Sun*) hiển thị đúng trên web & mobile.
- [ ] Có About card với bio + 4 quick facts.
- [ ] Có education item ≥ 1 entry.
- [ ] Animation reveal mượt khi scroll.
- [ ] i18n hoạt động đủ 3 ngôn ngữ (chuyển locale → text đổi).
- [ ] Không có warning/error khi build (`flutter build web`).

### Hạng mục 2
- [ ] `web/index.html` có đầy đủ: title, description, OG, Twitter, JSON-LD, hreflang, canonical.
- [ ] Validate qua [opengraph.xyz](https://www.opengraph.xyz/) hoặc [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/).
- [ ] Validate JSON-LD qua [Schema.org Validator](https://validator.schema.org/).
- [ ] `robots.txt` và `sitemap.xml` accessible sau khi deploy.
- [ ] OG image hiển thị đúng khi share link.

---

## Rủi ro & lưu ý

- **Slang i18n codegen**: sau khi sửa file `*.i18n.json`, cần chạy lại `dart run slang` để regenerate `strings.g.dart` — đã có Makefile, check command tương ứng.
- **Flutter web SEO hạn chế**: bot không chạy JS sẽ chỉ thấy `<noscript>` fallback. Có thể cân nhắc thêm SSR (Flutter web không hỗ trợ native — sẽ phải dùng pre-render service). Phiên bản này chỉ tối ưu meta + structured data, đủ cho LinkedIn/Twitter share + Google index cơ bản.
- **Domain placeholder**: nếu chưa có domain final, tạm dùng URL Vercel/Firebase. Có thể update sau qua single find-replace.
- **OG image cache**: LinkedIn cache OG image rất lâu (~7 ngày). Sau khi đổi ảnh, dùng Post Inspector để force refresh.

---

## Sau plan này

Khi bạn confirm bắt đầu:
1. Tôi sẽ tạo TodoWrite list với các task từ bảng "Lộ trình thực thi".
2. Code từng task theo thứ tự, mark complete ngay khi xong.
3. Build & verify cuối cùng.
4. Báo cáo lại để bạn review và commit.

Nếu bạn muốn chia làm 2 PR (hạng mục 1 và 2 tách biệt) hay 1 PR gộp — cho tôi biết trước khi bắt đầu.
