# Booky App

Booky is a modern *Flutter-based library application* designed to provide an elegant and interactive reading experience. The app features *user authentication, book browsing, favorites management, and detailed book views*, all wrapped in a clean and intuitive UI.

## Features

* *User Authentication*

  * Register and log in securely.
  * Form validation with meaningful error messages.

* *Home & Categories*

  * Browse books by category.
  * Explore featured and popular titles.

* *Book Details*

  * View detailed information about books.
  * Add/remove books from favorites with a heart toggle.

* *Modern UI/UX*

  * Clean typography, responsive layout.
  * Smooth navigation with animations.

## Tech Stack

* *Framework:* Flutter
* *Language:* Dart
* *UI:* Material Design + Custom Widgets
* *State Management:* setState (basic) – scalable to Provider or Riverpod
* *Other:*

  * Form validation logic in AuthController
  * Custom widgets for buttons, cards, and app bars

## Project Structure


lib/
├── auth/
│   ├── view/          # SignIn & SignUp screens
│
├── books/
│   ├── view/          # Book details, home screen, categories
│   ├── widgets/       # BookCard, custom UI components
│
├── core/
│   ├── constants/     # App colors, iImage Paths
│   ├── widgets/       # Shared UI components (button_effect, appbar, etc.)
│
└── main.dart


## Screenshots

// To be added


## To Be Made

* [ ] Connect to a backend (Firebase or API)
* [ ] Implement persistent storage for favorites
* [ ] Add search functionality
* [ ] Enhance book categorization with filters and sorting
* [ ] Dark mode support
