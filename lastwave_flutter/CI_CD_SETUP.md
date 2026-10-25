# LastWave Flutter CI/CD Pipeline Setup

This guide explains how to set up cloud-based iOS builds for the LastWave Flutter app using GitHub Actions and Codemagic.

## Overview

Since you don't have a Mac for iOS development, this setup uses cloud CI/CD:

| Platform | Tool | Purpose |
|----------|------|---------|
| **Android + Web + Analysis** | GitHub Actions (ubuntu-latest) | Free tier: 2000 min/month |
| **iOS** | GitHub Actions (macos-latest) | Free tier: 2000 min/month |
| **iOS (Alternative)** | Codemagic | Free tier: 500 min/month, M1 Mac Mini |

---

## 1. GitHub Actions Setup (Recommended)

### Prerequisites
- GitHub repository with LastWave Flutter code
- Apple Developer Account (for TestFlight/App Store)

### Repository Secrets to Configure

Go to **Settings → Secrets and variables → Actions** and add:

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `APP_STORE_CONNECT_API_KEY` | Base64-encoded .p8 file | App Store Connect → Users & Access → Keys |
| `APP_STORE_CONNECT_API_KEY_ID` | Key ID from App Store Connect | Same as above |
| `APP_STORE_CONNECT_ISSUER_ID` | Issuer ID from App Store Connect | Same as above |
| `TEAM_ID` | Apple Developer Team ID | Apple Developer Portal |

### ExportOptions.plist Variables

The workflow uses `$(TEAM_ID)` which will be replaced at build time via environment variables.

### Triggering Builds

```bash
# Push to main/develop for CI
git push origin main

# Tag a release for deployment
git tag v4.3.1
git push origin v4.3.1
```

### Workflow Files

- `.github/workflows/flutter.yml` - Main CI/CD pipeline
- Runs on: push to main/develop, tags (v*), pull requests

---

## 2. Codemagic Setup (Alternative for iOS)

### Why Codemagic?
- Free tier: 500 build minutes/month
- Faster M1 Mac Mini instances
- Native iOS build optimization
- Built-in TestFlight/App Store publishing

### Setup Steps

1. **Go to [Codemagic](https://codemagic.io)**
2. **Sign in with GitHub**
3. **Add application** → Select your LastWave repository
4. **Configure workflow** (uses `codemagic.yaml` in repo root)
5. **Add environment variables** in Codemagic UI:

| Variable | Value | Secure |
|----------|-------|--------|
| `APP_STORE_CONNECT_API_KEY` | Your .p8 key content | ✅ |
| `APP_STORE_CONNECT_API_KEY_ID` | Key ID | ✅ |
| `APP_STORE_CONNECT_ISSUER_ID` | Issuer ID | ✅ |

### Triggering Codemagic Builds

- **Manual**: Click "Start new build" in Codemagic UI
- **Automatic**: Push a tag (v*) → Codemagic webhook triggers build
- **Branch builds**: Configure in Codemagic settings

---

## 3. Apple Developer Setup

### Create App Store Connect API Key

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Navigate to **Users & Access → Keys**
3. Click **+** to create new key
4. Name: `LastWave CI/CD`
5. Role: **App Manager** (or Developer)
6. Download the `.p8` file (save securely!)
7. Note the **Key ID** and **Issuer ID**

### Convert .p8 to Base64

```bash
# On Windows (PowerShell)
[Convert]::ToBase64String([IO.File]::ReadAllBytes("AuthKey_XXXXXXXX.p8"))

# On Mac/Linux
base64 -i AuthKey_XXXXXXXX.p8
```

### Team ID

1. Go to [Apple Developer Portal](https://developer.apple.com/account)
2. Navigate to **Membership**
3. Copy **Team ID** (10-character string)

---

## 4. Running the Pipeline

### Local Development

```bash
# Get dependencies
flutter pub get

# Run tests
flutter test

# Build for Android
flutter build apk --release
flutter build appbundle --release

# Build for iOS (requires Mac or CI)
flutter build ipa --release --export-options-plist=ExportOptions.plist
```

### GitHub Actions

The pipeline runs automatically on:
- Push to `main` or `develop`
- Pull requests to `main`
- Tag pushes (`v*`)

### Codemagic

1. **Manual**: Click "Start new build" → Select `ios-release` workflow
2. **Automatic**: Push a tag like `v4.3.1`

---

## 5. Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| "No signing certificate" | Add Apple Developer certificates to CI |
| "Provisioning profile missing" | Use automatic signing in ExportOptions.plist |
| "Build timeout" | Increase `max_build_duration` in codemagic.yaml |
| "Flutter version mismatch" | Pin Flutter version in workflow |

### GitHub Actions macOS Limits

- Free tier: 2000 minutes/month
- macOS runners are slower than Linux
- Consider Codemagic for faster iOS builds

---

## 6. Cost Analysis

| Service | Free Tier | Paid Tier |
|---------|-----------|-----------|
| GitHub Actions | 2000 min/month | $0.008/min |
| Codemagic | 500 min/month | $29/mo for 5000 min |
| Apple Developer | $99/year | Required for TestFlight/App Store |

**Estimated cost for LastWave**: ~$0/month with free tiers, $99/year for Apple Developer Program.

---

## 7. Next Steps

1. ✅ **Done**: CI/CD configuration files created
2. 🔄 **Next**: Add secrets to GitHub/Codemagic
3. 🔄 **Next**: Push to GitHub to trigger first build
4. 🔄 **Next**: Verify iOS build succeeds
5. 🔄 **Next**: Set up TestFlight distribution

---

## Files Created

```
lastwave_flutter/
├── .github/
│   └── workflows/
│       └── flutter.yml          # GitHub Actions pipeline
├── codemagic.yaml               # Codemagic iOS workflow
├── ExportOptions.plist          # iOS export configuration
└── CI_CD_SETUP.md              # This file
```

---

## Quick Reference Commands

```bash
# Check build status
gh run list --workflow=Flutter%20CI/CD

# Download iOS artifact
gh run download --name ios-build

# Trigger Codemagic build via API
curl -X POST https://api.codemagic.io/builds \
  -H "Authorization: Bearer $CODMAGIC_API_TOKEN" \
  -d '{"workflowId": "ios-release"}'
```

For questions, see [Codemagic docs](https://docs.codemagic.io) or [GitHub Actions docs](https://docs.github.com/actions).