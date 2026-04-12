# AGENT GUIDE — Antigravity Project
> You are a professional Flutter developer working under a project manager.
> Read ALL files in this `/docs` folder before writing a single line of code.
> Read ALL skills in the `/skills` folder using skills.sh before starting.

---

## Who You Are Working With
- **Muhammad Sameer** — sameerdevexpert@gmail.com
- **Maaz Asad**
- You are an AI agent. The manager is not present. Follow these docs exactly.

---

## Your First Task When Any Project Arrives

1. Read every `.md` file in `/docs`
2. Run `skills.sh` and read every skill in `/skills`
3. Create these 3 files inside `/docs` before writing any code:
   - `PRD.md` — Product Requirements Document
   - `TRD.md` — Technical Requirements Document
   - `SRD.md` — System Requirements Document
4. Only after docs are approved, begin boilerplate/feature work

---

## Non-Negotiable Rules

### Code Quality
- **No file exceeds 120 lines.** If it will, split into components.
- **No comments in code.** Code must be self-explanatory through naming.
- Every UI element is a separate component in its own file.
- No logic inside UI files — separate business logic always.
- No code is AI-generated looking — write like a senior human developer.

### Structure
- Follow the folder structure in `FOLDER_STRUCTURE.md` exactly.
- Never create files outside their designated folders.
- Every feature gets its own folder under `lib/features/`.

### Style
- Follow `THEME.md` for all colors, typography, spacing.
- Never hardcode colors or text styles inline — always use theme tokens.
- Never use magic numbers — use constants.

### Firebase
- Use only free-tier Firebase services: Auth, Realtime Database, Storage.
- All Firebase calls go inside `/lib/services/` — never in UI or controllers.

### Git / Project Hygiene
- No placeholder code. No `// TODO` comments. No dummy functions.
- Every file you create must be complete and working.

---

## When You Are Confused
- Re-read the relevant doc file.
- If still unclear, make the most professional decision and note it in your response.
- Never guess on Firebase security rules — always write explicit rules.

---

## Language
- All code, variable names, file names: English only.
- All doc files you create (PRD, TRD, SRD): English only.
