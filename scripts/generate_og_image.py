"""Generate web/og-image.png (1200x630) for Open Graph share previews.

Re-run after editing copy:
    python3.12 scripts/generate_og_image.py

NOTE: Developer utility — not used in CI or app runtime. Font lookup
tries macOS (Arial), then common Linux distros (DejaVu, Liberation),
then Windows; falls back to Pillow's bitmap default if nothing matches
(low-quality output but the script still completes).
"""

from PIL import Image, ImageDraw, ImageFont

OUT = "web/og-image.png"
W, H = 1200, 630

img = Image.new("RGB", (W, H), "#090A0F")
draw = ImageDraw.Draw(img, "RGBA")

# Vertical gradient #1B2838 -> #090A0F
top = (0x1B, 0x28, 0x38)
bottom = (0x09, 0x0A, 0x0F)
for y in range(H):
    t = y / (H - 1)
    r = int(top[0] * (1 - t) + bottom[0] * t)
    g = int(top[1] * (1 - t) + bottom[1] * t)
    b = int(top[2] * (1 - t) + bottom[2] * t)
    draw.line([(0, y), (W, y)], fill=(r, g, b))

# Radial glow in upper-right (periwinkle)
glow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
gd = ImageDraw.Draw(glow)
for r in range(420, 0, -20):
    alpha = int(40 * (1 - r / 420))
    gd.ellipse([960 - r, 130 - r, 960 + r, 130 + r], fill=(203, 201, 226, alpha))
img.paste(glow, (0, 0), glow)

# Decorative stars
for cx, cy, rad, color, op in [
    (1050, 120, 4, (203, 201, 226), 180),
    (980, 180, 3, (203, 201, 226), 130),
    (1100, 230, 4, (255, 215, 0), 150),
    (150, 500, 3, (203, 201, 226), 100),
    (80, 420, 4, (255, 215, 0), 130),
]:
    draw.ellipse([cx - rad, cy - rad, cx + rad, cy + rad], fill=color + (op,))

# Fonts — try platform-specific candidates, fall back to Pillow default.
_FONT_CANDIDATES = {
    "regular": [
        "/System/Library/Fonts/Supplemental/Arial.ttf",  # macOS
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",  # Debian/Ubuntu
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",  # RHEL/Fedora
        "C:/Windows/Fonts/arial.ttf",  # Windows
    ],
    "bold": [
        "/System/Library/Fonts/Supplemental/Arial Black.ttf",  # macOS
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",  # Debian/Ubuntu
        "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",  # RHEL/Fedora
        "C:/Windows/Fonts/arialbd.ttf",  # Windows
    ],
}


def load_font(style: str, size: int):
    for path in _FONT_CANDIDATES[style]:
        try:
            return ImageFont.truetype(path, size)
        except OSError:
            continue
    return ImageFont.load_default()


font_kicker = load_font("regular", 26)
font_title = load_font("bold", 140)
font_sub = load_font("regular", 22)

# Kicker
draw.text((100, 130), "HAI HO PORTFOLIO", fill=(203, 201, 226), font=font_kicker)

# Title — two lines: "Mobile" white, "Developer" periwinkle
draw.text((100, 200), "Mobile", fill=(255, 255, 255), font=font_title)
draw.text((100, 350), "Developer", fill=(203, 201, 226), font=font_title)

# Subline
draw.text(
    (100, 540),
    "Flutter · Kotlin · KMP · Unity — crafting apps across Japan & Vietnam",
    fill=(203, 201, 226, 220),
    font=font_sub,
)

img.save(OUT, "PNG", optimize=True)
print(f"wrote {OUT} ({W}x{H})")
