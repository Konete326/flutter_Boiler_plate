# THEME DOCUMENT — Antigravity
> This is the default boilerplate theme. When a real project arrives,
> the manager will provide updated colors/fonts. Update this file first,
> then apply across the app. Never hardcode any value — always use tokens.

---

## Design Philosophy
- Clean, modern, professional.
- Dark mode first — light mode as secondary.
- Minimal visual noise. Let content breathe.
- Consistent 8px spacing grid.
- No gradients unless intentional. No shadows unless functional.

---

## Color Palette (Tokens)

### Dark Theme (Primary)
```dart
// lib/theme/app_colors.dart

const kBackgroundDark     = Color(0xFF0A0A0F);   // near black
const kSurfaceDark        = Color(0xFF13131A);   // card/surface
const kSurfaceElevated    = Color(0xFF1C1C27);   // elevated elements
const kBorderDark         = Color(0xFF2A2A38);   // subtle borders

const kPrimary            = Color(0xFF6C63FF);   // purple accent
const kPrimaryLight       = Color(0xFF8B85FF);   // hover/lighter
const kPrimaryDark        = Color(0xFF4A43CC);   // pressed

const kSuccess            = Color(0xFF34C77B);
const kError              = Color(0xFFFF5C5C);
const kWarning            = Color(0xFFFFB347);

const kTextPrimary        = Color(0xFFF0F0F5);   // main text
const kTextSecondary      = Color(0xFF8888A0);   // muted text
const kTextDisabled       = Color(0xFF44444F);   // disabled
```

### Light Theme (Secondary)
```dart
const kBackgroundLight    = Color(0xFFF6F6FB);
const kSurfaceLight       = Color(0xFFFFFFFF);
const kSurfaceElevatedL   = Color(0xFFF0F0F8);
const kBorderLight        = Color(0xFFE0E0EE);

const kTextPrimaryLight   = Color(0xFF0A0A1A);
const kTextSecondaryLight = Color(0xFF6B6B80);
```

---

## Typography

```dart
// Font: Sora (display) + Inter (body)
// Add to pubspec: google_fonts: latest

// Display
kHeadingXL  → Sora, 32px, FontWeight.w700
kHeadingL   → Sora, 24px, FontWeight.w700
kHeadingM   → Sora, 20px, FontWeight.w600
kHeadingS   → Sora, 16px, FontWeight.w600

// Body
kBodyL      → Inter, 16px, FontWeight.w400
kBodyM      → Inter, 14px, FontWeight.w400
kBodyS      → Inter, 12px, FontWeight.w400
kBodyBold   → Inter, 14px, FontWeight.w600

// Label
kLabelL     → Inter, 14px, FontWeight.w500, letterSpacing: 0.5
kLabelS     → Inter, 11px, FontWeight.w500, letterSpacing: 0.8, uppercase
```

---

## Spacing System (8px grid)

```dart
const kSpace2  =  2.0;
const kSpace4  =  4.0;
const kSpace8  =  8.0;
const kSpace12 = 12.0;
const kSpace16 = 16.0;
const kSpace20 = 20.0;
const kSpace24 = 24.0;
const kSpace32 = 32.0;
const kSpace40 = 40.0;
const kSpace48 = 48.0;
const kSpace64 = 64.0;
```

---

## Border Radius

```dart
const kRadiusXS =  4.0;
const kRadiusS  =  8.0;
const kRadiusM  = 12.0;
const kRadiusL  = 16.0;
const kRadiusXL = 24.0;
const kRadiusFull = 999.0;
```

---

## Elevation / Shadow

```dart
// Use sparingly. Only for modals and bottom sheets.
kShadowCard = BoxShadow(
  color: Color(0x1A000000),
  blurRadius: 16,
  offset: Offset(0, 4),
);
```

---

## Animation Durations

```dart
const kDurationFast   = Duration(milliseconds: 150);
const kDurationNormal = Duration(milliseconds: 250);
const kDurationSlow   = Duration(milliseconds: 400);

const kCurveDefault   = Curves.easeInOut;
const kCurveSnappy    = Curves.easeOut;
```

---

## Component Defaults

### Buttons
- Primary: filled `kPrimary`, border radius `kRadiusM`, height 48px
- Secondary: outlined `kPrimary`, same radius/height
- Text: no border, `kPrimary` text
- Disabled: `kSurfaceElevated` background, `kTextDisabled` text

### Input Fields
- Background: `kSurfaceDark` (dark) / `kSurfaceLight` (light)
- Border: `kBorderDark` default, `kPrimary` focused
- Border radius: `kRadiusM`
- Height: 52px

### Cards
- Background: `kSurfaceDark`
- Border: 1px `kBorderDark`
- Radius: `kRadiusL`
- Padding: `kSpace16`

---

## How to Update Theme When Project Arrives

1. Manager will provide new colors/fonts in this file or verbally.
2. Update ONLY this `THEME.md` and `lib/theme/` files.
3. Since tokens are used everywhere, changes propagate automatically.
4. Never change colors anywhere else in the codebase.
