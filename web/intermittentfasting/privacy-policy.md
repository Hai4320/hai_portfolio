# Privacy Policy

**App:** Intermittent Fasting Game
**Google Play:** https://play.google.com/store/apps/details?id=com.lepetit.hari.intermittent_fasting
**Last updated:** 2026-07-26
**Contact:** lepetithari@gmail.com

This policy describes what data Intermittent Fasting Game (the "app") collects, how it is used, and how it is shared. By using the app, you agree to the practices described below.

## 1. Data stored on your device

The following data is stored **locally** on your device (SQLite database and app preferences) and is **not** sent to any server unless you enable the leaderboard feature (section 3):

- Profile information you enter: birth year, sex, height, weight (current / starting / target), waist, blood glucose (optional), name and email (optional).
- Self-reported health screening flags: pregnancy/breastfeeding, Type 1 diabetes, eating disorder, chronic medication, other conditions.
- Fasting session history, quest progress, points, and rank.
- Optional measurements and notes you record per session: weight, waist, blood glucose, insulin, hunger/difficulty rating, free-text note, break reason.
- Read status of knowledge articles and app settings.

You can delete all local data by uninstalling the app or clearing the app's data in your operating system settings.

## 2. Sensitive health data

Health information (weight, blood glucose, medical flags) is used **on-device only** to personalize your roadmap and run safety screening. The app does **not** sell or share health data with third parties for advertising purposes.

## 3. Leaderboard (optional — requires sign-in)

The leaderboard feature is **optional**. You can also continue as a **guest** (anonymous sign-in): guest accounts are never synced and never appear on the leaderboard.

Only when you sign in with Google, and only once you have at least one non-zero metric, is the following data written to Google Firebase (Cloud Firestore):

- Your account identifier (UID).
- An auto-generated nickname (e.g. `hero1234`).
- The display name from your profile, or your Google display name if you left the profile name empty (falls back to "Ẩn danh"). This name **is visible to other users** on the leaderboard — leave the profile name blank or use a pseudonym if you prefer not to be identified.
- Competitive metrics: total points, total cumulative fasting hours, weight lost.

Your email address is handled by Firebase Authentication for sign-in only; it is **not** written to the leaderboard and is **never shown to other users**. Other users see only your display name, nickname, and competitive metrics — never your health information, profile details, or session history.

Signing out stops all further syncing; data already on the leaderboard stays until deleted (section 7).

## 4. Third-party services

The app uses Google Firebase services:

- **Firebase Authentication + Google Sign-In** — sign-in (Google or anonymous guest) for the leaderboard.
- **Cloud Firestore** — stores the leaderboard data described in section 3.
- **Firebase Analytics** — anonymous usage statistics: screens viewed, and the events start fast / break fast / complete fast (with target hours and points) / quest completed. No profile, health, or measurement data is sent.
- **Firebase Crashlytics** — crash and error reports to fix bugs.

Google's processing of this data is governed by Google's Privacy Policy: https://policies.google.com/privacy

## 5. Device permissions

- **Notifications** — remind you when you reach a fasting goal. Can be turned off in your OS settings.
- **Run at startup** (`RECEIVE_BOOT_COMPLETED`) — only to re-schedule your pending fasting reminders after the device restarts.

When you share a progress image, the app hands the image to your operating system's share sheet; you choose the destination app. Tapping a source link opens it in your browser. Neither action sends data to us.

## 6. Children

The app is intended for people **18 years and older** and is not directed at children. We do not knowingly collect data from children under 13.

## 7. Data retention and deletion

- Local data: kept until you uninstall the app or clear the app's data.
- Leaderboard data: kept on Firestore until you request deletion. Signing out in the app stops further syncing but does not delete the existing entry. To delete your leaderboard entry and account, contact **lepetithari@gmail.com**.

## 8. Your rights

You have the right to access, correct, or request deletion of your personal data. Send requests to the contact email above.

## 9. Changes to this policy

This policy may be updated. Changes will be reflected in this document with a new update date.

## 10. Medical disclaimer

The app supports intermittent fasting practice and is **not a substitute for medical advice**. Consult a healthcare professional before changing your diet.

## Contact

For any privacy questions: **lepetithari@gmail.com**
