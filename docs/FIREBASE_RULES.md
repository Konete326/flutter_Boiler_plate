# FIREBASE RULES — Antigravity
> These are the default security rules for the boilerplate.
> When a project arrives, update rules to match actual data structure.
> Never use test mode rules in production. Never set `.read: true` globally.

---

## Realtime Database Rules

```json
{
  "rules": {
    ".read": false,
    ".write": false,

    "users": {
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid",
        ".validate": "newData.hasChildren(['email', 'createdAt'])"
      }
    }
  }
}
```

### Rules Philosophy
- Default deny everything (`false` at root).
- Each user can only read/write their own node.
- Validate required fields on write.
- Never give a user access to another user's data.
- Add rules per-collection as features are built.

---

## Firebase Storage Rules

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if false;
    }

    match /users/{uid}/{allPaths=**} {
      allow read: if request.auth != null && request.auth.uid == uid;
      allow write: if request.auth != null
                   && request.auth.uid == uid
                   && request.resource.size < 5 * 1024 * 1024;
    }
  }
}
```

### Storage Rules Notes
- Max upload size: 5MB per file (free tier protection).
- User can only access their own storage folder.
- Authenticated users only — no public read by default.
- When profile images need to be publicly readable, add explicit rule.

---

## How to Update Rules When Project Arrives

1. Identify all database collections from PRD.md.
2. Define who reads and writes each collection.
3. Write explicit rules for each collection.
4. Test rules in Firebase Console Rules Playground before deploying.
5. Update this file to reflect the new rules.

---

## Common Patterns to Use

### User-specific data (default pattern)
```json
"$uid": {
  ".read": "$uid === auth.uid",
  ".write": "$uid === auth.uid"
}
```

### Shared readable, user-writable
```json
"posts": {
  ".read": "auth !== null",
  "$postId": {
    ".write": "auth !== null && newData.child('authorId').val() === auth.uid"
  }
}
```

### Admin-only write
```json
"config": {
  ".read": "auth !== null",
  ".write": "auth !== null && root.child('users').child(auth.uid).child('role').val() === 'admin'"
}
```

---

## Free Tier Monitoring
- Set up Firebase Usage Alerts in the console.
- Alert at 80% of Realtime Database storage (800MB).
- Alert at 80% of Storage (4GB).
- Add rate limiting logic in `database_service.dart` for heavy write operations.
