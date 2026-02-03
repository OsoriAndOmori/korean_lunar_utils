#!/usr/bin/env bash
set -e

echo "🔍 Reading version from pubspec.yaml..."

if [ ! -f pubspec.yaml ]; then
  echo "❌ pubspec.yaml not found"
  exit 1
fi

VERSION=$(grep -E '^version:' pubspec.yaml | awk '{print $2}')

if [ -z "$VERSION" ]; then
  echo "❌ Could not find version in pubspec.yaml"
  exit 1
fi

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "❌ Version must be x.y.z format (got: $VERSION)"
  exit 1
fi

echo "📦 Version detected: $VERSION"

echo "🔄 Fetching tags..."
git fetch --tags

if git rev-parse "$VERSION" >/dev/null 2>&1; then
  echo "❌ Tag $VERSION already exists locally"
  exit 1
fi

if git ls-remote --tags origin | grep -q "refs/tags/$VERSION$"; then
  echo "❌ Tag $VERSION already exists on remote"
  exit 1
fi

echo "🏷 Creating tag $VERSION"
git tag "$VERSION"

echo "🚀 Pushing tag to origin"
git push origin "$VERSION"

echo "✅ Tag pushed."
echo "📡 GitHub Actions will now publish to pub.dev."
