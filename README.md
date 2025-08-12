# 🎬 Netflix Clone App (Flutter)

A responsive Netflix-style Flutter app 🎥 showcasing trending, top-rated, and upcoming movies using the TMDB API.  
Includes ❤️ favorites, 🔍 search, onboarding, and splash screens. Fully responsive for 📱 mobile, 💻 tablet, and 🌐 web (Chrome).

---

## ✨ Features
- 🚀 **Splash & Onboarding** flow with Lottie animations  
- 📊 **Trending**, ⭐ **Top Rated**, and ⏳ **Upcoming** movie sections  
- 🎯 Movie details with overview, rating, and release date  
- ❤️ **Favorites (Watchlist)** management  
- 🔍 Search movies via TMDB API  
- 📱💻 **Fully responsive** layout for mobile, tablet, and web  

---

## 🛠 Getting Started

## 🛠 Getting Started

### 📋 Prerequisites
- Flutter SDK ≥ 3.7.2  
- Enable Flutter web support:  
```bash
flutter config --enable-web
flutter devices
▶ Run App (Mobile)
bash
Copy
Edit
flutter pub get
flutter run
🌐 Run App (Web)
bash
Copy
Edit
flutter run -d chrome
📂 Project Structure
bash
Copy
Edit
lib/
 ├── api/api.dart
 ├── models/movie.dart
 ├── screens/
 │    ├── home_screen.dart
 │    ├── details_screen.dart
 │    ├── search_screen.dart
 │    ├── favorites_screen.dart
 │    ├── onboarding_screen.dart
 │    └── splash_screen.dart
 ├── constants.dart
 └── main.dart
📏 Responsive Design
Uses MediaQuery 📐 and relative sizing to adapt UI on all devices — optimized for Chrome/web.

🚀 Deploy to Netlify
1️⃣ Build your Flutter web app:
bash
Copy
Edit
flutter build web
2️⃣ Deploy using Netlify:
Drop deployment: Drag & drop the build/web folder at Netlify Drop

Git deployment:

Push project to GitHub

On Netlify, connect the repo

Build command:

bash
Copy
Edit
flutter build web
Publish directory:

bash
Copy
Edit
build/web
