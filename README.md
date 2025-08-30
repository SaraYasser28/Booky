# Booky App

**Booky** is a modern **Flutter-based library application** designed to provide an elegant and interactive reading experience.
The app features **user authentication, book browsing, favorites management, search, and detailed book views**, all wrapped in a **clean and intuitive UI**.

---

##  Features

### User Authentication

* Register and log in securely.
* Form validation with meaningful error messages.

### Home & Categories

* Browse books by category.
* Explore featured and popular titles.

### Book Details

* View detailed information about each book.
* Add/remove books from favorites with a heart toggle.

### Favorites

* Persistent favorites storage using **Hive**.
* Manage and view your saved books easily.

### Search

* Search across books by title or author.
* Powered by **SearchCubit** for state management.

### Modern UI/UX

* Clean typography and responsive layout.
* Smooth navigation with animations.
* Custom reusable widgets for app bars, buttons, and book cards.

---

## Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **UI:** Material Design + Custom Widgets
* **State Management:** Flutter Bloc (Cubit)
* **Local Storage:** Hive (for favorites & user data)
* **API**: Google Books API

---

## Project Structure

lib/
├── core/
│   ├── constants/     # App colors, image paths
│   ├── widgets/       # Shared UI components (buttons, app bars, etc.)
│
├── features/
│   ├── auth/
│   │   ├── data/      # Models, repositories, services
│   │   ├── logic/     # Cubits for auth
│   │   ├── view/      # SignIn & SignUp screens
│   │
│   ├── books/
│   │   ├── data/      # Models, repositories, services
│   │   ├── logic/     # Cubits for books & favorites
│   │   ├── view/      # Home, categories, book details
│   │   ├── widgets/   # BookCard, etc.
│   │
│   ├── search/
│   │   ├── logic/     # SearchCubit
│   │   ├── view/      # Search screen
│
├── main.dart


---

## Screenshots

Coming soon...

---

## Roadmap

* [x] Phase 1 | Core UI setup (auth, books, favorites)
* [x] Phase 2 | Favorites and book cubit
* [x] Phase 3 | Search Functionality, Hive local DB and Google Books API integration
* [ ] Enhance book categorization with filters and sorting
* [ ] Dark mode support

---
