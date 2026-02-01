#!/bin/bash

# Run Flutter analyzer for linting (generated files are excluded via analysis_options.yaml)
echo "🔍 Running Flutter analyzer..."
flutter analyze

# Check for lint issues
if [ $? -eq 0 ]; then
    echo "✅ No lint issues found!"
else
    echo "❌ Lint issues detected. Please fix them."
    exit 1
fi

