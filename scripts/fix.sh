#!/bin/bash

# Auto-fix lint issues (generated files are excluded via analysis_options.yaml)
echo "🔧 Auto-fixing lint issues..."
dart fix --apply

echo "✅ Auto-fix complete!"

