# Deployment Guide

Deploy Flutter Portfolio to Vercel.

## Prerequisites

- Flutter 3.35.6 (via FVM)
- Node.js >= 16.x
- Vercel CLI: `npm install -g vercel`

## Quick Deploy

```bash
# Run deploy script
./scripts/deploy.sh
```

## Manual Deploy

### 1. Build

```bash
fvm flutter build web --release
```

### 2. Deploy

```bash
cd build/web
vercel --prod
```

## Vercel Setup (First Time)

1. Go to [vercel.com](https://vercel.com)
2. Import repository
3. Configure:
   - **Build Command:** `flutter/bin/flutter build web --release`
   - **Output Directory:** `build/web`
   - **Install Command:** `git clone https://github.com/flutter/flutter.git -b stable && flutter/bin/flutter doctor`

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Blank page | Check `<base href="/">` in `web/index.html` |
| Assets not loading | Run `fvm flutter clean` and rebuild |

## Production URL

https://hari-github-io.vercel.app/

