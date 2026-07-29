# Privacy Policy

**App:** Intermittent Fasting Game
**Google Play:** https://play.google.com/store/apps/details?id=com.lepetit.hari.intermittent_fasting
**Published at:** https://hari-github-io.vercel.app/intermittentfasting/privacy_policy.html (linked from Settings → Privacy; re-upload the HTML whenever this file changes)
**Last updated:** 2026-07-29
**Contact:** lepetithari@gmail.com

This policy describes what data Intermittent Fasting Game (the "app") collects, how it is used, and how it is shared. By using the app, you agree to the practices described below.

## 1. Data stored on your device

The following data is stored **locally** on your device (SQLite) and is **not** sent to any server unless you enable the leaderboard feature (section 3):

- Profile information you enter: birth year, sex, height, weight (current / starting / target), waist, blood glucose (optional), name and email (optional).
- Self-reported health screening flags: pregnancy/breastfeeding, Type 1 diabetes, eating disorder, chronic medication, other conditions.
- Fasting session history: start/end time, target hours, outcome, optional before/after measurements (weight, blood glucose, insulin, waist), optional end-of-fast survey (how you felt, hunger, difficulty), free-text note, and break reason.
- Quest progress, the points ledger, and your rank.
- App preferences: chosen language, reading font size, and whether you have seen the onboarding / pre-fast guide.

You can delete all local data by uninstalling the app or clearing the app's data in your operating system settings.

## 2. Sensitive health data

Health information (weight, blood glucose, insulin, waist, medical flags) is used **on-device only** to personalize your roadmap and run safety screening. The one exception: if you turn on the leaderboard, the number of kilograms lost is uploaded as a score (section 3) — never the underlying weights, glucose readings, or medical flags. The app does **not** sell or share health data with third parties for advertising purposes.

## 3. Leaderboard (optional — requires sign-in)

The leaderboard feature is **optional**. Only when you actively sign in with Google is the following data synced to Google Firebase (Cloud Firestore):

- Account identifier (UID) from Google — your **email address is never uploaded to the leaderboard and never shown publicly**.
- The display name from your profile (or your Google display name if the profile has none; "Ẩn danh" / Anonymous if both are empty) — this **is visible to other users**, so use a nickname there if you prefer not to show your real name.
- An auto-generated nickname (e.g. "hero4827") shown next to your name. The nickname is also stored in a separate registry mapped to your UID, so no two users get the same one.
- Competitive metrics: total points, total cumulative fasting hours, weight lost (kg — the difference between your starting and current weight, never the weights themselves).
- The time of the last sync.

Nothing is uploaded until at least one of those metrics is above zero. The leaderboard is readable only by signed-in users, and they only see your display name, nickname, and those three metrics — never your email, weight, blood glucose, or medical flags.

Metrics are self-reported by the app on your device. Signing out stops any further sync; the row already on the server stays until deleted (section 8).

## 4. Third-party services

The app uses Google Firebase services:

- **Firebase Authentication + Google Sign-In** — sign-in for the leaderboard. When you sign in, Firebase Authentication stores an account record containing your Google email address, display name, and profile photo URL. That record is not part of the leaderboard and is not shown to other users.
- **Cloud Firestore** — stores the leaderboard data described in section 3.
- **Firebase Analytics** — usage statistics (e.g. screens opened, start/end fast, quest completion) used to improve the app. These are **pseudonymous, not anonymous**: they are tied to an app instance identifier and include technical data such as device model, OS version, app version, and approximate country. They are not linked to your name, email, or health data.
- **Firebase Crashlytics** — crash reports (stack trace, device model, OS version, app state at the time of the crash, and an installation identifier) used to fix bugs.

Analytics and Crashlytics run for everyone, including users who never sign in. The app contains **no ads**, no advertising SDK, and no push-messaging service — all reminders are generated locally on your device. We do **not** sell your data.

Google's processing of this data is governed by Google's Privacy Policy: https://policies.google.com/privacy

## 5. Device permissions

- **Notifications** (`POST_NOTIFICATIONS`, Android 13+) — remind you when you reach a fasting goal. Reminders are scheduled locally; nothing is sent to a server. Can be turned off in your OS settings.
- **Run at startup** (`RECEIVE_BOOT_COMPLETED`) — re-schedules your pending fasting reminders after the device restarts. No data is collected.
- **Internet** — needed only for sign-in, the leaderboard, Analytics, and Crashlytics. The fasting timer, roadmap, and articles all work offline.

## 6. Sharing

Share buttons (share a rank or streak card) are always started by you. The app renders a PNG image on your device and hands it to the app you pick in the system share sheet. What happens next is governed by that app's own privacy policy. Nothing is shared automatically.

## 7. Children

The app is intended for people **18 years and older** and is not directed at children. We do not knowingly collect data from children under 13.

## 8. Data retention and deletion

- Local data: kept until you uninstall the app or clear the app's data.
- Leaderboard data: kept on Firestore until you request deletion. Signing out (Profile screen) stops further syncing but does not delete the existing row.
- To delete your leaderboard row, your reserved nickname, and your Firebase Authentication account, email **lepetithari@gmail.com** from the address you signed in with. Requests are handled within 30 days.
- Analytics and Crashlytics data are retained on Google's servers according to Firebase's own retention settings and are not linked to your identity.

## 9. Your rights

You have the right to access, correct, or request deletion of your personal data. Send requests to the contact email above.

## 10. Changes to this policy

This policy may be updated. Changes will be reflected in this document with a new update date.

## 11. Medical disclaimer

The app supports intermittent fasting practice and is **not a substitute for medical advice**. Consult a healthcare professional before changing your diet.

## Contact

For any privacy questions: **lepetithari@gmail.com**
