#!/usr/bin/env bash
set -e

APP_NAME="pet_nutrition_app_full"
echo "==> Creating Flutter project: $APP_NAME"
flutter create $APP_NAME

cd $APP_NAME

echo "==> Overwriting lib/main.dart, pubspec.yaml and copying assets"
rm -f lib/main.dart
cp -r ../lib ./
cp -r ../assets ./
cp ../pubspec.yaml ./pubspec.yaml

echo "==> Fetching packages"
flutter pub get

echo "==> Generating launcher icons & splash"
dart run flutter_launcher_icons
dart run flutter_native_splash:create

echo "==> Building debug APK (for quick test)"
flutter build apk --debug

echo "==> Building release App Bundle (Play Store)"
flutter build appbundle --release

echo "==> Done! Artifacts:"
echo "  - build/app/outputs/flutter-apk/app-debug.apk"
echo "  - build/app/outputs/bundle/release/app-release.aab"
