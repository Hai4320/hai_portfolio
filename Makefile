.PHONY: help format lint fix clean build run test pub-get pub-upgrade analyze all

# Default target
help:
	@echo "Available commands:"
	@echo "  make format      - Format all Dart files"
	@echo "  make lint        - Run Flutter analyzer"
	@echo "  make fix         - Auto-fix lint issues"
	@echo "  make analyze     - Run dart analyze"
	@echo "  make clean       - Clean build artifacts"
	@echo "  make build       - Build the app"
	@echo "  make run         - Run the app"
	@echo "  make test        - Run tests"
	@echo "  make pub-get     - Get dependencies"
	@echo "  make pub-upgrade - Upgrade dependencies"
	@echo "  make all         - Format, lint, and build"

# Format Dart files (excluding generated files)
format:
	@echo "🎨 Formatting Dart files..."
	@find lib/ -name "*.dart" \
		! -name "*.g.dart" \
		! -name "*.freezed.dart" \
		! -name "*.gen.dart" \
		! -name "*.gr.dart" \
		! -name "*.config.dart" \
		! -name "*.mocks.dart" \
		-exec dart format --line-length=120 {} +
	@echo "✅ Format complete!"

# Run linter
lint:
	@echo "🔍 Running Flutter analyzer..."
	@flutter analyze

# Auto-fix lint issues (generated files are excluded via analysis_options.yaml)
fix:
	@echo "🔧 Auto-fixing lint issues..."
	@dart fix --apply
	@echo "✅ Auto-fix complete!"

# Run dart analyze
analyze:
	@echo "🔍 Running dart analyze..."
	@dart analyze

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@flutter clean
	@echo "✅ Clean complete!"

# Build the app
build:
	@echo "🏗️ Building the app..."
	@flutter build

# Run the app
run:
	@echo "🚀 Running the app..."
	@flutter run

# Run tests
test:
	@echo "🧪 Running tests..."
	@flutter test

# Get dependencies
pub-get:
	@echo "📦 Getting dependencies..."
	@flutter pub get
	@echo "✅ Dependencies installed!"

# Upgrade dependencies
pub-upgrade:
	@echo "📦 Upgrading dependencies..."
	@flutter pub upgrade
	@echo "✅ Dependencies upgraded!"

# Build runner (for code generation)
build-runner:
	@echo "⚙️ Running build_runner..."
	@dart run build_runner build --delete-conflicting-outputs
	@echo "✅ Build runner complete!"

# Generate localization
gen-l10n:
	@echo "🌍 Generating localizations..."
	@dart run slang
	@echo "✅ Localization generated!"

# Format, lint, and build
all: format lint build
	@echo "✅ All tasks complete!"

# Check before commit (format + lint)
pre-commit: format lint
	@echo "✅ Pre-commit checks passed!"

deploy:
	@echo "🚢 Deploying the app..."
	bash scripts/deploy.sh
	@echo "✅ Deployment complete!"

