# News Reader App (Flutter)

A simple **News Reader application** built with **Flutter**, **Riverpod**, and **MVVM architecture**.  
This project demonstrates a clean, scalable architecture with mock data, bookmark functionality, and reactive UI.

## Project Structure

lib/
├── core/
│ ├── services/
│ │ ├── mock_news_service.dart # Mock news API
│ │ └── validator.dart # Email & password validators
│ └── widgets/
│ │  ├── news_card.dart # Reusable card for news items
│ │  ├── loading_state_widget.dart # Loading indicator
│ │  ├── error_state_widget.dart # Error UI
│ │  └── empty_state_widget.dart # Empty state UI
│ └──constants/
│    └──app_constants.dart
├── data/
│ ├── models/
│ │ └── article_model.dart # Article model with bookmark field
│ └── repositories/
│ └── news_repository.dart 
| └── auth_repository.dart 
| └── sources/
│   └── auth_data_source.dart
|   └── bookmark_data_source.dart
│
├── presentation/
|| └── screens/
│ ├── login_screen/
│ │ ├── login_screen.dart # Login UI
│ │ └── viewmodel/login_view_model.dart # Login state
│ └── news_list/
│ ├── news_list_screen.dart # News list UI
│ ├── book_marks_screen.dart # Bookmarks screen
│ └── viewmodel/news_list_viewmodel.dart # News state, bookmark logic
│
└── main.dart # App entry point & routes

## Features
### Login Screen
- Simple login UI using **Form + ValidatorService**
- Accepts **any non-empty email with @gmail.com and password** (mock login)
- Basic email/password validation using regex 

### News List Screen
- Displays a **list of articles** with title, description, and optional image
- Bookmark toggle for each article
- Handles **loading**, **error**, and **empty states**  

### Bookmark Screen
- Shows **all bookmarked articles**
- Supports **unbookmarking** items live
- Fully reactive with Riverpod  

### Drawer Menu
- **Menu button** on top-left
- **Bookmarks** navigation
- **Logout** functionality → returns to login  