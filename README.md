# Flutter Base App 📱

<div align="center">
  <img src="assets/logo/logo.png" alt="Flutter Base App Logo" width="120" height="120">
  
  <h3>Modern Flutter Application</h3>
  <p>Clean Architecture • Pixel Perfect Design • Responsive UI</p>
  
  ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
  ![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
</div>

## 🎯 Project Overview

Flutter Base App is a modern mobile application built with Flutter following Clean Architecture principles and modern development practices. The app features **pixel perfect** responsive design, comprehensive state management, and a scalable architecture suitable for production applications.

## ✨ Key Features

### 🔐 **Authentication System**
- **User Registration & Login** with email/password
- **JWT Token Management** with automatic refresh
- **Social Login Integration** (Apple, Google)
- **Secure Local Storage** with SharedPreferences
- **Form Validation** with real-time feedback
- **Password Strength Validation**
- **Terms & Conditions** acceptance flow

### 🎬 **Movie Management**
- **Infinite Scrolling** with pagination support
- **Snap Scrolling** with smooth vertical navigation
- **Favorite System** with local & remote sync
- **Pull-to-Refresh** with custom animations
- **Shimmer Loading** animations
- **Image Caching** for optimal performance
- **Search & Filter** capabilities

### 👤 **Profile Management**
- **User Profile** display with avatar support
- **Photo Upload** with image compression
- **Profile Photo Viewer** with hero animations
- **Limited Offer** promotional system
- **Settings & Preferences**

### 📸 **Photo Upload System**
- **Image Picker** with gallery access
- **Permission Handling** for camera/storage
- **Image Compression** for optimal file sizes
- **Upload Progress** tracking
- **Error Handling** with retry mechanism

### 🎨 **UI/UX Excellence**
- **Pixel Perfect** responsive design
- **Dark/Light Theme** support
- **Material Design 3** compliance
- **Custom Animations** with Lottie
- **Shimmer Effects** for loading states
- **Hero Animations** for smooth transitions
- **Safe Area** handling across devices

## 🏗️ Architecture

### **Clean Architecture Implementation**
```
lib/
├── core/                 # Shared infrastructure
│   ├── constants/       # App constants & assets
│   ├── di/             # Dependency injection
│   ├── error/          # Error handling
│   ├── extensions/     # Dart extensions
│   ├── mixins/         # Reusable mixins
│   ├── network/        # HTTP client & interceptors
│   ├── router/         # Navigation routing
│   ├── theme/          # App theming
│   ├── utils/          # Utility functions
│   └── widgets/        # Reusable widgets
├── domain/             # Business logic layer
│   └── usecases/       # Use case implementations
└── features/           # Feature-based modules
    ├── auth/           # Authentication
    ├── movie/          # Movie management
    ├── profile/        # User profile
    ├── photo_upload/   # Photo upload
    ├── splash/         # Splash screen
    └── main/           # Main navigation
```

### **Feature Module Structure**
Each feature follows a consistent structure:
```
feature_name/
├── constants/          # Feature-specific constants
├── data/              # Data layer
│   ├── datasources/   # Remote & local data sources
│   ├── models/        # Data models with JSON serialization
│   ├── repositories/  # Repository implementations
│   └── services/      # API service classes
├── domain/            # Domain layer
│   ├── entities/      # Business entities
│   ├── repositories/  # Repository abstractions
│   └── usecases/      # Business logic use cases
└── presentation/      # Presentation layer
    ├── blocs/         # BLoC state management
    ├── pages/         # UI screens
    └── widgets/       # Feature-specific widgets
```

## 🚀 Technology Stack

### **Core Framework**
- **Flutter SDK**: ^3.5.4
- **Dart**: ^3.5.4

### **State Management**
- `flutter_bloc: ^8.1.3` - BLoC pattern for state management
- `equatable: ^2.0.5` - Value equality for state comparison
- `freezed: ^2.4.5` - Immutable data classes

### **Dependency Injection**
- `get_it: ^7.6.4` - Service locator pattern
- `injectable: ^2.3.2` - Code generation for DI

### **Network Layer**
- `dio: ^5.4.0` - HTTP client with interceptors
- `retrofit: ^4.0.3` - Type-safe REST API client
- `pretty_dio_logger: ^1.3.1` - Network request logging

### **Local Storage**
- `hive_flutter: ^1.1.0` - NoSQL local database
- `shared_preferences: ^2.2.2` - Key-value storage
- `cached_network_image: ^3.4.1` - Image caching

### **UI/UX Libraries**
- `flutter_screenutil: ^5.9.3` - Responsive screen adaptation
- `shimmer: ^3.0.0` - Loading shimmer effects
- `lottie: ^3.1.3` - Complex animations
- `flutter_svg: ^2.0.9` - SVG support

### **Navigation & Routing**
- `go_router: ^13.2.0` - Declarative routing

### **Internationalization**
- `easy_localization: ^3.0.7` - Multi-language support

### **Image Handling**
- `image_picker: ^1.0.7` - Image selection from gallery/camera
- `flutter_image_compress: ^2.3.0` - Image compression
- `permission_handler: ^11.3.1` - Runtime permissions

### **Analytics & Monitoring**
- `firebase_analytics: ^11.3.3` - Firebase Analytics
- `mixpanel_flutter: ^2.3.1` - Mixpanel Analytics

## 📱 Responsive Design

### **Design System Specifications**
```dart
// Base Design Size (iPhone 14)
const Size(402, 844)

// Responsive Implementation
- ScreenUtil for pixel-perfect scaling
- Minimum text adaptation for readability
- Split screen mode support
- Safe area handling across all devices
```

### **Supported Screen Sizes**
- **Small Phones**: 320px - 374px width
- **Medium Phones**: 375px - 413px width  
- **Large Phones**: 414px - 767px width
- **Small Tablets**: 768px - 1023px width
- **Large Tablets**: 1024px+ width

## 🛠️ Development Setup

### **Prerequisites**
- Flutter SDK ^3.5.4
- Dart SDK ^3.5.4
- Android Studio / VS Code
- iOS development tools (for iOS development)

### **Installation Steps**

1. **Clone Repository**
```bash
git clone <repository-url>
cd flutter_base_app
```

2. **Install Dependencies**
```bash
flutter pub get
```

3. **Generate Code**
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

4. **Run Application**
```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# Specific platform
flutter run -d android
flutter run -d ios
```

## 🧪 Development Tools

### **Code Generation**
The app uses several code generation tools:

```bash
# Generate all code (run after model changes)
flutter packages pub run build_runner build --delete-conflicting-outputs

# Watch for changes during development
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

### **Mason Brick System**
Create new features quickly with the custom brick template:

```bash
# Install Mason CLI
dart pub global activate mason_cli

# Add the brick
mason add feature_brick --path bricks/feature_brick

# Generate new feature
mason make feature_brick --feature_name=payment
```

This automatically creates:
- Complete Clean Architecture structure
- BLoC boilerplate code
- Repository pattern files
- Use case templates
- Data models with JSON serialization

### **Code Quality Tools**
- **Flutter Lints**: Static analysis with custom rules
- **Dart Format**: Consistent code formatting
- **Import Sorter**: Organized import statements

## 🌍 Internationalization

### **Supported Languages**
- 🇺🇸 **English** (en) - Default
- 🇹🇷 **Türkçe** (tr)

### **Adding New Languages**
1. Create new JSON file in `assets/translations/`
2. Update `supportedLocales` in `main.dart`
3. Add translations to `AppStrings` class

### **Usage Example**
```dart
Text(AppStrings.welcomeBack), // Uses current locale
Text('welcome_back'.tr()),    // Direct translation
```

## 📦 Build & Deployment

### **Android Build**
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle for Google Play
flutter build appbundle --release
```

### **iOS Build**
```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release
```

### **App Icons & Splash Screen**
The app includes automated configuration for:
- **App Icons**: Configured via `flutter_launcher_icons`
- **Splash Screen**: Configured via `flutter_native_splash`
- **Adaptive Icons**: Android 12+ support

## 🔧 Configuration

### **API Configuration**
```dart
// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://your-api.com';
  static const String loginEndpoint = '/user/login';
  static const String registerEndpoint = '/user/register';
  // ... other endpoints
}
```

### **Environment Setup**
Update configuration files for different environments:
- Development: Use local/staging APIs
- Production: Use production APIs
- Testing: Use mock data

## 🚀 Performance Features

### **Optimizations Implemented**
- **ListView.builder**: Efficient scrolling for large lists
- **Image Caching**: Automatic image caching with CachedNetworkImage
- **Code Splitting**: Lazy loading with feature modules
- **Memory Management**: Proper disposal of resources
- **Network Optimization**: Request/response interceptors
- **State Persistence**: Efficient state management with BLoC

### **Loading States**
- **Shimmer Effects**: Skeleton loading animations
- **Progressive Loading**: Content appears as it loads
- **Error Boundaries**: Graceful error handling with retry options

## 🧪 Testing

### **Testing Strategy**
- **Unit Tests**: Business logic and use cases
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end user flows

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
```

## 🔒 Security Features

### **Implemented Security Measures**
- **JWT Token Management**: Secure token storage and refresh
- **Input Validation**: Client-side validation for all forms
- **Network Security**: HTTPS enforcement
- **Permission Handling**: Proper runtime permission requests
- **Error Handling**: No sensitive data in error messages

## 📊 Analytics Integration

### **Tracking Capabilities**
- **User Events**: Login, registration, feature usage
- **Performance Metrics**: App startup time, screen load times
- **Error Tracking**: Crash reporting and error analytics
- **Custom Events**: Feature-specific analytics

## 🤝 Contributing

### **Development Guidelines**
1. Follow Clean Architecture principles
2. Use BLoC pattern for state management
3. Write comprehensive tests
4. Follow Dart/Flutter style guidelines
5. Update documentation for new features

### **Pull Request Process**
1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Me, it's me**
- 📧 Email: ilkeryildirimdev@gmail.com
---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Clean Architecture Guide](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [BLoC Pattern Documentation](https://bloclibrary.dev/)
- [Material Design Guidelines](https://material.io/design)

---

<div align="center">
  <p><strong>Built with ❤️ using Flutter</strong></p>
  <p><em>Modern • Scalable • Production Ready</em></p>
</div> 