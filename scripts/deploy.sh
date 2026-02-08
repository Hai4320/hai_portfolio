#!/bin/bash

# Deploy script for Hai Portfolio
# Usage: ./scripts/deploy.sh

set -e

echo "🧹 Cleaning build..."
fvm flutter clean

echo "📦 Getting dependencies..."
fvm flutter pub get

echo "🏗️ Building web..."
fvm flutter build web --release

echo "🚀 Deploying to Vercel..."
cd build/web
vercel --prod

echo "✅ Deployment complete!"

