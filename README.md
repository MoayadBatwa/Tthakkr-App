# Tthakkr App

A Flutter-based Islamic lifestyle application that helps users with prayer times, daily athkar, Qibla direction, and the names of Allah.

## Overview
This app is structured as a multi-feature mobile application with a bottom navigation bar and separate screens for each main function. It uses Flutter, Bloc state management, and Go Router for navigation.

## Included Features

### 1. Prayer Times Screen
- Displays prayer time information
- Shows the current time and prayer schedule
- Built with a dedicated Bloc and UI card layout

### 2. Athkar Screen
- Displays collections of Islamic supplications
- Supports category-based navigation
- Shows chapter details and athkar list items in Arabic and translation

### 3. Qibla Screen
- Detects device location and direction
- Shows a Qibla compass using the Flutter Qiblah package
- Handles permission errors and location issues gracefully

### 4. Allah Names Screen
- Displays a grid of Allah’s names
- Includes Arabic names and translated meanings
- Uses a reusable card UI component

## App Screens:
<img width="720" height="1300" alt="Simulator Screenshot - iPhone 17 - 2026-09-17 at 21 22 52" src="https://github.com/user-attachments/assets/7d98d60d-1902-4a45-9ba7-a658638e8e31" />
<img width="720" height="1300" alt="Simulator Screenshot - iPhone 17 - 2026-09-17 at 21 21 59" src="https://github.com/user-attachments/assets/5cae2dda-aeec-45d5-bf68-58f6b832c17e" />
<img width="720" height="1300" alt="Simulator Screenshot - iPhone 17 - 2026-09-17 at 21 21 49" src="https://github.com/user-attachments/assets/2a764372-50ab-414f-af9b-b4049efe43b4" />
<img width="720" height="1300" alt="Simulator Screenshot - iPhone 17 - 2026-09-17 at 21 21 43" src="https://github.com/user-attachments/assets/e4915165-3e13-48a4-9cd4-eae62196083f" />
<img width="720" height="1300" alt="Screenshot_1789750924" src="https://github.com/user-attachments/assets/f555d54e-41c9-4b9b-844a-9c720589cf6c" />


## App Structure
- `lib/main.dart` - App entry point and MaterialApp setup
- `lib/core/` - Shared theme, colors, icons, and navigation logic
- `lib/features/` - Feature-based screens and Bloc logic
- `lib/common widget/` - Shared reusable widgets
- `assets/` - Fonts, icons, and static assets

## Navigation
The app uses a bottom navigation bar with these sections:
- Prayers
- Athkar
- Qiblah
- Subhah (Allah Names)

## Project Files
- `lib/features/prayer_time_feature/` - Prayer time logic and screen
- `lib/features/athkar_feature/` - Athkar categories, chapters, and items
- `lib/features/qibla_feature/` - Qibla compass and location logic
- `lib/features/AllahNames/` - Allah names screen and grid display
- `lib/core/navigation/` - Router and app navigation

## Tech Stack
- Flutter
- Dart
- Bloc pattern (`flutter_bloc`)
- Go Router
- Geolocator
- Flutter Qiblah
- Muslim Data Flutter
- Flutter SVG

## Getting Started
1. Install Flutter SDK
2. Run:
   ```bash
   flutter pub get
   ```
3. Start the app:
   ```bash
   flutter run
   ```

## Notes
This project is already implementing real app functionality and is organized by feature modules, making it suitable for extension and further development.
