# Todo App - Pure Task Manager 📋

Welcome to **Todo App**, a clean and powerful task management app built with Flutter! This project showcases my mastery of `ChangeNotifier` for seamless state management, wrapped in a modern, user-friendly UI. It’s simple, efficient, and ready to shine on GitHub. 🚀

## Why This App Rocks

This isn’t just a todo list—it’s a testament to clean logic and smart design. I leveraged Flutter’s `ChangeNotifier` to manage state like a pro, ensuring real-time updates without complexity. The app lets you organize tasks into categories, check them off, and delete them, all with a polished interface that screams professionalism.

## Features

- **Category-Based Organization**: Create, manage, and delete categories for your tasks.
- **Task Management**: Add, check, or remove tasks within each category.
- **Real-Time Updates**: UI refreshes instantly using `ListenableBuilder`.
- **Modern UI**: Cards, animations, and light/dark mode for a slick experience.
- **No Dependencies**: Pure Flutter, keeping it lightweight and maintainable.

## Logic Breakdown

The app’s logic is the star of the show, built around simplicity and efficiency. Here’s the core:

### State Management with `ChangeNotifier`

- **Core Class**: `CategoryManager` (extends `ChangeNotifier`) handles all state.
- **Data Structure**: Uses `CategoryModel` (name, checkbox, list of `TaskModel`) and `TaskModel` (name, checkbox).
- **Key Operations**:
  - Add/remove categories and tasks.
  - Toggle checkboxes for categories/tasks.
  - `notifyListeners()` ensures reactive UI updates.
- **Why It’s Smart**: `ChangeNotifier` centralizes state, avoids external libraries, and keeps the code clean.

### Reactive UI

- **ListenableBuilder**: Wraps `ListView` in `TodoHome` and `TaskListScreen`, rebuilding only when needed.
- **Efficiency**: Scoped updates minimize performance overhead.

### Example Code

How to add a task:

```dart
void addTask(int categoryIndex, String taskName) {
  mainCategories[categoryIndex].taskModels.add(
    TaskModel(taskName: taskName, isChecked: false),
  );
  notifyListeners();
}
```

This simplicity makes the logic easy to understand and extend.

### Architecture

- **Modular Design**: Separates models (`CategoryModel`, `TaskModel`), state (`CategoryManager`), and UI (`TodoHome`, `TaskListScreen`).
- **No Bloat**: Built with vanilla Flutter for maximum control.

## Installation

Get it running in minutes:

### Prerequisites

- Flutter SDK (3.0.0+)
- Dart
- Code editor (VS Code, Android Studio)

### Steps

1. **Clone the Repo**:

   ```bash
   git clone https://github.com/your-username/todo-app.git
   cd todo-app
   ```
2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```
3. **Run the App**:

   ```bash
   flutter run
   ```

## Usage

- **Home Screen**: View categories. Hit the FAB (`+`) to add a category.
- **Task Screen**: Tap a category to manage its tasks. Use the FAB to add tasks.
- **Manage Tasks**: Check off or delete tasks with ease.
- **Enjoy**: Smooth UI with fade-in animations and a teal/amber theme.

## Future Improvements

- Local storage with `shared_preferences`.
- Task priorities or due dates.
- Filters for completed tasks.
- Push notifications.

## Screenshots
![Home Screen](screenshots/home.png)
![Task List](screenshots/tasks.png)
## Contributing

This is a solo project for now, but feedback is welcome! Open an issue or reach out. To contribute:

1. Fork the repo.
2. Create a feature branch (`git checkout -b feature/awesome-idea`).
3. Submit a pull request.

## License

Licensed under the MIT License. See LICENSE for details.

## Contact

Questions or ideas? Hit me up on GitHub or open an issue. Let’s make this even better! 😎

---

*Built with 💪 using Flutter.*
