# Antigravity

Flutter boilerplate — production-ready, scalable, clean architecture.

## Team
- Muhammad Sameer — sameerdevexpert@gmail.com
- Maaz Asad

## Stack
- **Flutter** (mobile + web)
- **Firebase** — Auth (Google), Realtime Database, Storage
- **Riverpod** — state management
- **Go Router** — navigation

## First Time Setup

```bash
# 1. Clone and install dependencies
flutter pub get

# 2. Copy env file and fill in values
cp .env.example .env

# 3. Firebase setup (see below)

# 4. Run
flutter run
```

## Firebase Manual Setup
1. Create project at console.firebase.google.com
2. Enable Google Sign-In under Authentication > Sign-in methods
3. Enable Realtime Database — start in locked mode
4. Enable Storage — start in production mode
5. Run `flutterfire configure` to generate `firebase_options.dart`
6. Apply rules from `docs/FIREBASE_RULES.md`

## Agent — Read This First
All docs are in `/docs`. Read every file before writing code.
Run `skills/skills.sh` to load all available skills.
Follow `docs/BOILERPLATE_CHECKLIST.md` step by step.
