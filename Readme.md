# Todo App

A modern **SwiftUI Todo application** built with **MVVM architecture**, supporting task management, reminders, statistics, themes, and localization.

## Features

* ✅ Create, complete, and delete tasks
* 🔔 Reminder notifications
* 📊 Statistics with completion progress
* 🌙 Light / Dark / System theme
* 🌍 Localization (English & Azerbaijani)
* 🔎 Search and category filtering
* 💾 Local persistence using UserDefaults
* 🧪 Unit tests for ViewModel logic

## Screens

The application contains the following screens:

* Todos list
* Add new todo
* Todo details
* Statistics
* Settings
* Theme selection
* Language selection

## Architecture

The project follows the **MVVM (Model–View–ViewModel)** architecture.

Project structure:

```
Todo
├── Enums
│   ├── AppLanguage
│   ├── AppTheme
│   └── TodoCategory
│
├── Models
│   └── Todo
│
├── Services
│   └── NotificationManager
│
├── ViewModels
│   └── TodoViewModel
│
├── Views
│   ├── Components
│   │   ├── FilterSheetView
│   │   └── TabBarView
│   │
│   ├── Settings
│   │   ├── SettingsView
│   │   ├── ThemeView
│   │   ├── LanguageView
│   │   └── StatisticView
│   │
│   └── Todo
│       ├── TodoView
│       ├── AddTodoView
│       └── TodoDetail
│
├── Resources
│   ├── Assets
│   └── Localizable
│
├── ContentView
└── TodoApp
```

## Persistence

Todos are stored locally using **UserDefaults** with **JSONEncoder / JSONDecoder**.

This allows the app to keep tasks even after the application is closed.

## Localization

The app supports multiple languages:

* 🇺🇸 English
* 🇦🇿 Azerbaijani

Localization is implemented using **Localizable.strings**.

## Notifications

Reminder notifications are implemented using **UserNotifications** via a custom `NotificationManager`.

## Requirements

* iOS 17+
* Xcode 15+
* SwiftUI

## Future Improvements

* Edit existing todos
* Drag & reorder tasks
* Charts for statistics
* Cloud sync
* User accounts

## Author

Elvin Yuzbayov

iOS Developer

