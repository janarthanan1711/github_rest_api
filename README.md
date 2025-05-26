# Github Repo

A Flutter application that integrates GitHub authentication and displays repository information.

## 🚀 Getting Started

This project serves as a starting point for a GitHub-integrated Flutter application.

### 📦 Prerequisites

Ensure you have the following installed:
- Flutter SDK: [Install Flutter](https://docs.flutter.dev/get-started/install)
- A GitHub OAuth application: [Create OAuth App](https://github.com/settings/developers)

### 🔐 OAuth Credentials

To run the app, you need to provide your GitHub OAuth credentials securely using `--dart-define`:

```bash
flutter run --dart-define=GITHUB_CLIENT_ID=your_client_id --dart-define=GITHUB_CLIENT_SECRET=your_client_secret

