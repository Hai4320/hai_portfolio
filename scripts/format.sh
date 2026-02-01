#!/bin/bash

# Auto format Dart files (excluding generated files)
echo "🎨 Formatting Dart files..."

# Find and format all Dart files excluding generated ones
find lib/ -name "*.dart" \
    ! -name "*.g.dart" \
    ! -name "*.freezed.dart" \
    ! -name "*.gen.dart" \
    ! -name "*.gr.dart" \
    ! -name "*.config.dart" \
    ! -name "*.mocks.dart" \
    ! -name "strings.g.dart" \
    -exec dart format --line-length=120 {} +

echo "✅ Format complete!"

