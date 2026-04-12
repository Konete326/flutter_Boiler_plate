# BOILERPLATE CHECKLIST — Antigravity
> Work through this list top to bottom. Check each item mentally before moving to next.
> Do not skip steps. Do not reorder steps.

---

## Phase 0 — Before Any Code
- [ ] Read AGENT_GUIDE.md
- [ ] Read TRD.md
- [ ] Read THEME.md
- [ ] Read FOLDER_STRUCTURE.md
- [ ] Read FIREBASE_RULES.md
- [ ] Run skills.sh and read all skills
- [ ] Confirm understanding — proceed only then

---

## Phase 1 — Project Init
- [ ] `flutter create antigravity --org com.antigravity`
- [ ] Delete default counter app code from `main.dart`
- [ ] Set up `analysis_options.yaml` (strict linting)
- [ ] Create `.gitignore` (include `.env`, `*.jks`, `google-services.json`, `GoogleService-Info.plist`)
- [ ] Create `.env.example` with placeholder keys
- [ ] Add all dependencies to `pubspec.yaml` per TRD.md
- [ ] Run `flutter pub get`

---

## Phase 2 — Firebase Setup
- [ ] Install FlutterFire CLI
- [ ] Run `flutterfire configure`
- [ ] Enable Google Sign-In in Firebase Console (manual step — note for developer)
- [ ] Enable Realtime Database in Firebase Console (manual step — note for developer)
- [ ] Enable Storage in Firebase Console (manual step — note for developer)
- [ ] Write `firebase_options.dart` is auto-generated (do not edit)
- [ ] Set Realtime Database rules per FIREBASE_RULES.md
- [ ] Set Storage rules per FIREBASE_RULES.md

---

## Phase 3 — Theme Layer
- [ ] `lib/theme/app_colors.dart` — all color tokens from THEME.md
- [ ] `lib/theme/app_typography.dart` — all text styles (Sora + Inter via google_fonts)
- [ ] `lib/theme/app_spacing.dart` — spacing + radius constants
- [ ] `lib/theme/app_animations.dart` — duration + curve constants
- [ ] `lib/theme/app_theme.dart` — dark ThemeData + light ThemeData using above tokens
- [ ] Verify: zero hardcoded colors or sizes anywhere

---

## Phase 4 — Core Layer
- [ ] `lib/core/constants/app_constants.dart` — app name, version, misc
- [ ] `lib/core/constants/route_constants.dart` — all route path strings
- [ ] `lib/core/extensions/context_extensions.dart` — theme, size, navigator shortcuts
- [ ] `lib/core/extensions/string_extensions.dart` — common string helpers
- [ ] `lib/core/utils/validators.dart` — email, phone, required validators
- [ ] `lib/core/utils/formatters.dart` — date, number formatters

---

## Phase 5 — Services Layer
- [ ] `lib/services/auth_service.dart` — Google sign-in, sign-out, auth state stream
- [ ] `lib/services/database_service.dart` — CRUD helpers for Realtime Database
- [ ] `lib/services/storage_service.dart` — upload, download, delete for Storage

---

## Phase 6 — Shared Widgets
- [ ] `lib/shared/widgets/app_button.dart` — primary, secondary, text variants
- [ ] `lib/shared/widgets/app_text_field.dart` — with validation support
- [ ] `lib/shared/widgets/app_card.dart` — base card with theme styling
- [ ] `lib/shared/widgets/app_loader.dart` — loading indicator (centered)
- [ ] `lib/shared/widgets/app_snackbar.dart` — success, error, info variants
- [ ] `lib/shared/widgets/app_avatar.dart` — user avatar with fallback initials
- [ ] `lib/shared/models/app_user.dart` — base user model (id, name, email, photoUrl)

---

## Phase 7 — Auth Feature
- [ ] `lib/features/auth/domain/auth_repository_interface.dart`
- [ ] `lib/features/auth/data/auth_repository.dart` — implements interface, calls auth_service
- [ ] `lib/features/auth/presentation/providers/auth_provider.dart`
  - `authStateProvider` — StreamProvider for Firebase auth state
  - `authRepositoryProvider` — Provider for repository
- [ ] `lib/features/auth/presentation/widgets/google_sign_in_button.dart`
- [ ] `lib/features/auth/presentation/screens/login_screen.dart`

---

## Phase 8 — Routing
- [ ] `lib/routing/route_guards.dart` — redirect unauthenticated users to login
- [ ] `lib/routing/app_router.dart` — GoRouter with all initial routes
  - `/` → home (guarded)
  - `/login` → login screen
- [ ] Add shell route for bottom nav if needed (skip for boilerplate)

---

## Phase 9 — main.dart
- [ ] Initialize Firebase
- [ ] Wrap with `ProviderScope`
- [ ] Pass GoRouter to `MaterialApp.router`
- [ ] Set theme (dark default, light available)
- [ ] Load `.env` via flutter_dotenv

---

## Phase 10 — Final Checks
- [ ] Run `flutter analyze` — zero warnings
- [ ] Run `flutter build apk --release` — builds without errors
- [ ] Run `flutter build web` — builds without errors
- [ ] Verify no file exceeds 120 lines
- [ ] Verify zero hardcoded colors/sizes/strings
- [ ] Verify zero comments in code
- [ ] Verify folder structure matches FOLDER_STRUCTURE.md exactly
- [ ] Update README.md with setup instructions

---

## README Must Include
1. Project name + one-line description
2. Tech stack list
3. Setup steps (clone → env setup → firebase setup → run)
4. Firebase manual steps the developer must do
5. Team members
6. Folder structure summary
