# Telex MVP

Telex is a cross-platform messaging application built with Flutter. This Minimum Viable Product (MVP) provides core functionalities to allow users to interact in real time through channels and threaded conversations.

## Features

- **User Authentication:**  
  - Login using email/password or magic link.
  - Secure logout functionality.

- **Channel Management:**  
  - View a list of channels with real-time updates.
  - Create new channels and join existing channels.
  
- **Live Chat:**  
  - Engage in live chat within channels.
  - View channel history when switching between channels.
  - Automatically stop updates from previous channels upon switching.

- **Enhanced Communication:**  
  - Use @mentions to notify specific users.
  - Support for threaded conversations similar to Slack.

- **Navigation & UI:**  
  - Consistent AppBar with localized titles, settings, and user profile dropdown.
  - Reusable Bottom Navigation Bar with clearly distinguishable active/inactive states.

## Project Structure

```
/lib
  /screens
    - channel_list_ui.dart   // Channel list screen with integrated bottom nav bar.
    - login_screen.dart      // User authentication screen.
    - chat_screen.dart       // Live chat interface.
    - settings_screen.dart   // Settings page.
  /widgets
    - bottom_nav_bar.dart    // Reusable bottom navigation bar.
    - user_profile_dropdown.dart  // Reusable user profile dropdown widget.
  /core
    /constants
      - app_colors.dart
      - app_text_styles.dart
    - app_theme.dart         // Application theme configuration.
```

## Installation

1. **Clone the Repository:**

   ```bash
   git clone this repo
   cd telex-mvp
   ```

2. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the Application:**

   ```bash
   flutter run
   ```

## Usage

- **Login:**  
  Start on the login screen, authenticate, and navigate to the main dashboard.

- **Channel List:**  
  The main dashboard displays a channel list with a reusable bottom navigation bar and AppBar. Tapping a channel takes the user to the live chat screen.

- **User Profile & Settings:**  
  The AppBar includes a settings button and a user profile dropdown for quick access to options like logout.

## Future Enhancements

- Integrate real-time messaging via WebSockets.
- Complete backend integration for authentication and channel management.
- Refine UI elements and add animations for improved user experience.
- Expand additional functionalities in Delve and Video App projects.

## License

This project is licensed under the MIT License.
