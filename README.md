Below is a well-structured `README.md` file for your Flutter News App assignment. It includes setup instructions, project overview, features, and other details to meet the submission guidelines (clean, structured, and well-commented code). You can tweak it to fit your personal style or additional details like your name or specific bonus features.

---

# News App - Flutter Assignment

A Flutter-based News App built with **GetX**, **MVVM architecture**, **HTTP requests**, and **UI animations** as part of a developer assignment. The app fetches news articles from the NewsAPI, displays them in an animated list, and includes advanced UI features like Hero animations, shimmer effects, and swipe-to-dismiss functionality.

## Objective
This project demonstrates proficiency in:
- **GetX**: State management, navigation, and dependency injection.
- **MVVM Architecture**: Separation of concerns with Model, ViewModel, and View layers.
- **HTTP Requests**: Fetching data from NewsAPI with error handling.
- **UI Animations**: Smooth transitions and loading effects for an optimized user experience.

## Features
### Task 1: News App with GetX & MVVM
- Fetches news articles from [NewsAPI](https://saurav.tech/NewsAPI/).
- Displays articles in a scrollable list with smooth animations.
- Implements MVVM architecture using GetX for state management.
- Includes a search bar to filter articles based on title.

### Task 2: Advanced UI Animations
- **Hero Animation**: Smooth transition from list to detailed article view.
- **Shimmer Effect**: Skeleton loader while fetching news.
- **Animated Bottom Navigation Bar**: (Optional implementation - can be added).
- **Swipe to Dismiss**: Remove articles from the list with a swipe gesture.

### Task 3: Bonus (Optional)
- **Confetti Animation**: Triggers a celebratory effect when refreshing news (requires `confetti` package).
- **Web-Friendly**: Tested to ensure compatibility with Flutter Web using `cached_network_image`.



## Requirements
- **Flutter**: Version 3.6.1 or later.
- **Dart**: Version 3.27.3 or later.
- **NewsAPI Key**: Obtain from [NewsAPI](https://saurav.tech/NewsAPI/sources.json) and add to the app.

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/news-app.git
   cd news-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Add API Key**:
   - No need a API key.

4. **Run the App**:
   - For mobile:
     ```bash
     flutter run
     ```
   - For web:
     ```bash
     flutter run -d chrome
     ```

5. **Build for Production** (optional):
   - Mobile: `flutter build apk` or `flutter build ios`.
   - Web: `flutter build web`.

## Project Structure
```
lib/
├── controllers/
│   └── news_controller.dart    # GetX controller for API calls and state
├── models/
│   └── news_article.dart       # Data model for news articles
├── views/
│   ├── home_page.dart          # Main screen with news list
│   └── detail_page.dart        # Detailed article view
├── widgets/
│   └── shimmer_loading.dart    # Shimmer effect widget
└── main.dart                   # App entry point
```

## Dependencies
- `get: ^4.6.6` - State management and navigation.
- `http: ^1.2.0` - HTTP requests to NewsAPI.
- `shimmer: ^3.0.0` - Shimmer effect for loading.
- `cached_network_image: ^3.3.1` - Optimized image loading (web-friendly).
- `confetti: ^0.7.0` (optional) - Bonus confetti animation.

## How It Works
1. **NewsController** fetches articles from NewsAPI on app start.
2. **HomePage** displays a searchable list with shimmer loading and swipe-to-dismiss.
3. Tapping an article triggers a Hero animation to the **DetailPage**.
4. Search filters articles in real-time using GetX observables.

## Evaluation Highlights
- ✅ **GetX Implementation**: Clean separation of logic and UI with controllers.
- ✅ **MVVM Architecture**: Model (data), ViewModel (controller), View (UI).
- ✅ **HTTP Handling**: Robust error handling with snackbar notifications.
- ✅ **Animations**: Hero, shimmer, and swipe-to-dismiss implemented.
- ✅ **Deadline**: Completed within 2 days (by February 25, 2025).

## Known Issues
- Some NewsAPI image URLs may fail to load on web due to CORS restrictions. `cached_network_image` mitigates this.
- Pagination is not implemented but can be added with `page` and `pageSize` API parameters.

## Future Improvements
- Add pagination for large article sets.
- Enhance UI with custom themes and typography.
- Implement offline caching with a local database.

## Submission
- Repository: [GitHub/GitLab Link] *(https://github.com/JainamO7/newsApp)*  
- Deadline: Submitted by February 24, 2025.

