# Personalized Weather Dashboard

A Flutter application that fetches and displays weather information based on student index number.

## Student Information
- **Student Index**: 224044P
- **Computed Coordinates**: 
  - Latitude: 7.20 (5 + 22/10)
  - Longitude: 83.00 (79 + 40/10)

## Features
- ✅ Student index input (pre-filled with 224044P)
- ✅ Automatic coordinate calculation from index
- ✅ Fetch weather data from Open-Meteo API
- ✅ Display temperature, wind speed, and weather code
- ✅ Show last updated timestamp
- ✅ Display full request URL for verification
- ✅ Loading indicator during API calls
- ✅ Error handling with friendly messages
- ✅ Offline caching using shared_preferences
- ✅ "(cached)" tag when displaying offline data
- ✅ Clean and intuitive UI

## Coordinate Calculation Formula
```
firstTwo = int(index[0..1])  // 22
nextTwo = int(index[2..3])   // 40
lat = 5 + (firstTwo / 10.0)  // 7.20
lon = 79 + (nextTwo / 10.0)  // 83.00
```

## API Used
Open-Meteo (No API key required):
```
https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true
```

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code with Flutter extensions
- Android device or emulator

### Installation
1. Clone or extract the project
2. Open terminal in project directory
3. Run: `flutter pub get`
4. Connect Android device or start emulator
5. Run: `flutter run`

## Dependencies
- `http: ^1.1.0` - For API calls
- `shared_preferences: ^2.2.2` - For local caching
- `intl: ^0.18.1` - For date formatting

## Testing the App

### Online Mode
1. Ensure device has internet connection
2. Enter or confirm student index (224044P)
3. Tap "Fetch Weather" button
4. View temperature, wind speed, weather code, and timestamp
5. Check the request URL at the bottom

### Offline Mode
1. Fetch weather data at least once (online)
2. Enable Airplane Mode on device
3. Tap "Fetch Weather" button
4. App will show error message and display cached data with "(cached)" tag

## Project Structure
```
lib/
  └── main.dart          # Main application code with UI and logic
pubspec.yaml             # Dependencies and project configuration
README.md                # This file
```

## Video Demo Checklist
- ✅ Display index, latitude, longitude
- ✅ Display request URL
- ✅ Tap Fetch Weather → Show live results
- ✅ Show temperature, wind speed, weather code
- ✅ Show last updated time
- ✅ Enable Airplane Mode
- ✅ Tap Fetch Weather → Show error + cached data
- ✅ Verify "(cached)" tag appears

## Report Content
Include in your report:
1. Student index: 224044P
2. Formula and calculated coordinates (7.20, 83.00)
3. Screenshots showing:
   - Main UI with all data
   - Request URL visible at bottom
   - Online and cached states
4. Reflection (3-5 sentences)

## Reflection Notes
This project demonstrated the integration of REST APIs in Flutter mobile applications. Key learnings included:
- Parsing JSON responses from weather APIs
- Implementing offline-first architecture with local caching
- Handling network errors gracefully
- Creating responsive and user-friendly mobile interfaces
- Managing asynchronous operations in Flutter

## License
This is an academic project for educational purposes.
Index-Based Weather Forecast System
