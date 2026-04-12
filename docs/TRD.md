# TECHNICAL REFERENCE DOCUMENT (TRD) — Antigravity Boilerplate
> This document defines the fixed technical stack. Do not deviate unless manager approves.

---

## Stack Overview

| Layer | Technology | Reason |
|---|---|---|
| Framework | Flutter (latest stable) | Cross-platform mobile + web |
| Language | Dart | Flutter native |
| State Management | Riverpod (hooks_riverpod) | Scalable, testable, no context dependency |
| Navigation | Go Router | Official Flutter team, deep linking, web URL support |
| Backend | Firebase (free tier only) | Real-time, serverless |
| Auth | Firebase Auth — Google Sign-In | Secure, fast, no password management |
| Database | Firebase Realtime Database | Real-time sync, offline support |
| Storage | Firebase Storage | File/image uploads |
| Env Config | flutter_dotenv | Secrets out of code |
| HTTP | Dio | If any REST calls needed |
| Local Storage | shared_preferences | Small local data only |

---

## Firebase Free Tier Limits (Stay Within These)
- Realtime Database: 1GB stored, 10GB/month download
- Storage: 5GB stored, 1GB/day download
- Auth: Unlimited users
- Hosting: 10GB storage, 360MB/day transfer

---

## Architecture Pattern: Feature-First Clean Architecture

```
lib/
  core/           → app-wide config, constants, utils, extensions
  features/       → one folder per feature
    feature_name/
      data/       → Firebase calls, models, repositories
      domain/     → entities, repository interfaces
      presentation/
        screens/  → full screens (max 120 lines each)
        widgets/  → reusable UI components for this feature
        providers/ → Riverpod providers for this feature
  services/       → shared Firebase services
  theme/          → all theme files
  routing/        → Go Router config
  shared/
    widgets/      → globally shared UI components
    models/       → shared data models
```

---

## State Management Rules (Riverpod)

- Use `ConsumerWidget` or `ConsumerStatefulWidget` — never `StatefulWidget` with manual state.
- Providers go in their feature's `providers/` folder.
- Use `AsyncNotifierProvider` for async data.
- Use `NotifierProvider` for sync state.
- Never use `StateProvider` for complex state.
- `ref.watch()` in build, `ref.read()` in callbacks — always.

---

## Navigation Rules (Go Router)

- All routes defined in `lib/routing/app_router.dart`.
- Use named routes only — no raw string paths in widgets.
- Route guards for auth handled via `redirect` in GoRouter.
- Deep link support configured from day one.

---

## Dependency Injection

- All providers are defined at the feature level.
- Repository providers use `Provider` (not `StateProvider`).
- Firebase instances injected via providers — never instantiated inside widgets.

---

## Code File Rules
- Max 120 lines per file — hard limit.
- If a widget needs more than 120 lines, extract sub-widgets.
- If a provider needs more than 120 lines, split into multiple providers.
- Named constructors over factory constructors where possible.
- `const` constructors wherever possible.

---

## Naming Conventions

| Type | Convention | Example |
|---|---|---|
| Files | snake_case | `user_profile_card.dart` |
| Classes | PascalCase | `UserProfileCard` |
| Variables | camelCase | `userProfile` |
| Constants | camelCase in `k` prefix | `kPrimaryColor` |
| Providers | camelCase + Provider suffix | `authStateProvider` |
| Routes | camelCase + Route suffix | `homeRoute` |

---

## pubspec.yaml — Core Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: latest
  firebase_auth: latest
  firebase_database: latest
  firebase_storage: latest
  google_sign_in: latest
  
  # State & Navigation
  hooks_riverpod: latest
  flutter_hooks: latest
  go_router: latest
  
  # Utils
  flutter_dotenv: latest
  dio: latest
  shared_preferences: latest
  equatable: latest
  
  # UI
  flutter_svg: latest
  cached_network_image: latest
  gap: latest

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: latest
  build_runner: latest
```

---

## Environment Setup

- `.env` file at project root — never commit to git.
- `.env.example` committed with placeholder keys.
- All Firebase config via `google-services.json` / `GoogleService-Info.plist` — gitignored.

---

## Error Handling Pattern

- All async operations wrapped in `AsyncValue` via Riverpod.
- UI reads `when(data, error, loading)` — never raw try/catch in widgets.
- Errors logged to console in debug, suppressed in release.
- User-facing errors shown via a global `SnackbarService`.
