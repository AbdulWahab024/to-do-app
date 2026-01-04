# 📝 To-Do List App

A modern, elegant, and feature-rich to-do list application built with Flutter. Keep track of your daily tasks with an intuitive interface and seamless user experience.

## ✨ Features

- **Task Management**: Create, view, and delete tasks effortlessly
- **Search Functionality**: Quickly find specific tasks with real-time search
- **Task Completion**: Mark tasks as complete or incomplete with smooth animations
- **Persistent Storage**: All tasks are saved locally using SharedPreferences
- **Material Design 3**: Beautiful UI following Google's latest design guidelines
- **Responsive Layout**: Optimized for different screen sizes
- **Empty State Handling**: Intuitive feedback when no tasks are available

## 📱 Demo

<div align="center">
  
  ![App Demo](assets/images/to-do app.gif)
  
  *Add your demo GIF in the `demo` folder*
  
</div>

## 🎨 Screenshots

<div align="center">
  
  | Home Screen | Add Task | Search Tasks |
  |-------------|----------|--------------|
  | ![Home](screenshots/home.png) | ![Add](screenshots/add_task.png) | ![Search](screenshots/search.png) |
  
  *Add your screenshots in the `screenshots` folder*
  
</div>

## 🚀 Getting Started

### Prerequisites

Before running this application, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Latest stable version)
- [Dart SDK](https://dart.dev/get-dart) (Included with Flutter)
- Android Studio / VS Code with Flutter extensions
- An Android or iOS device/emulator

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/yourusername/todo-list-app.git
   cd todo-list-app
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Run the app**
```bash
   flutter run
```

## 🛠️ Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **SharedPreferences**: Local data persistence
- **Material Design 3**: Modern UI components

## 📦 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

## 📂 Project Structure
```
lib/
├── main.dart           # Application entry point
├── HomeView.dart       # Main to-do list screen
└── ...
```

## 🎯 Usage

### Adding a Task
1. Tap the **floating action button** (+) at the bottom right
2. Enter your task in the text field
3. Press **Add** to save the task

### Completing a Task
- Tap the **checkbox** next to a task to mark it as complete
- The task text will be crossed out

### Searching Tasks
- Type in the **search bar** at the top to filter tasks in real-time

### Deleting a Task
- Tap the **delete icon** on any task to remove it

## 🎨 Customization

### Changing Theme Color

Edit the `main.dart` file to customize the app's color scheme:
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff234248)),
),
```

Replace `0xff234248` with your desired color hex code.

## 🧪 Testing

Run tests using:
```bash
flutter test
```

## 📱 Build for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Known Issues

- None at the moment

## 📝 Future Enhancements

- [ ] Task categories/tags
- [ ] Due dates and reminders
- [ ] Task priorities
- [ ] Dark mode support
- [ ] Cloud synchronization
- [ ] Task notes/descriptions
- [ ] Recurring tasks

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design guidelines
- All contributors who help improve this project

---

<div align="center">
  
  **If you found this project helpful, please give it a ⭐!**
  
  Made with ❤️ using Flutter
  
</div>
