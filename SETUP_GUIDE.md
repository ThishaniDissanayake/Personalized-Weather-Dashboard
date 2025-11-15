# SETUP AND RUNNING GUIDE
## Personalized Weather Dashboard - Student Index: 224044P

### Quick Start Commands

1. **Install Dependencies**
   ```powershell
   flutter pub get
   ```

2. **Run the App**
   ```powershell
   flutter run
   ```

3. **Build APK for Testing**
   ```powershell
   flutter build apk
   ```

---

## Detailed Setup Instructions

### Prerequisites Check
1. Verify Flutter installation:
   ```powershell
   flutter doctor
   ```
2. Ensure you have:
   - Flutter SDK installed
   - Android Studio with Android SDK
   - Android device connected or emulator running

### Step-by-Step Setup

#### 1. Navigate to Project Directory
```powershell
cd "d:\L3S1\Wireless\Personalized-Weather-Dashboard"
```

#### 2. Get Dependencies
```powershell
flutter pub get
```
This will download:
- http (for API calls)
- shared_preferences (for caching)
- intl (for date formatting)

#### 3. Check Connected Devices
```powershell
flutter devices
```
Make sure at least one device is available.

#### 4. Run the Application
```powershell
flutter run
```

---

## Testing Scenarios

### Scenario 1: Normal Operation (Online)
1. Open the app
2. Verify index shows: **224044P**
3. Check coordinates display:
   - **Latitude: 7.20**
   - **Longitude: 83.00**
4. Tap **"Fetch Weather"** button
5. Wait for loading indicator
6. Verify display shows:
   - Temperature in °C
   - Wind speed in km/h
   - Weather code (number)
   - Last updated timestamp
7. Scroll down to see the full **Request URL**:
   ```
   https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true
   ```

### Scenario 2: Offline Mode Testing
1. First, fetch weather data while online (complete Scenario 1)
2. Enable **Airplane Mode** on your device
3. Return to the app
4. Tap **"Fetch Weather"** button again
5. Verify:
   - Error message appears (red card)
   - Previous weather data still displays
   - **(cached)** tag appears next to "Current Weather"
6. Disable Airplane Mode to restore connectivity

---

## Video Recording Guide (≤60 seconds)

### Recording Checklist:
1. **Start Recording** (0:00)
2. Show the main screen with index **224044P** (0:05)
3. Point out computed coordinates: **Lat: 7.20, Lon: 83.00** (0:10)
4. Scroll to show the **Request URL** at bottom (0:15)
5. Tap **"Fetch Weather"** button (0:20)
6. Show loading indicator briefly (0:22)
7. Display the weather results:
   - Temperature
   - Wind speed
   - Weather code
   - Last updated time (0:30)
8. Open device settings or swipe down notification panel (0:35)
9. **Enable Airplane Mode** (0:40)
10. Return to app and tap **"Fetch Weather"** again (0:45)
11. Show error message appearing (0:50)
12. Scroll to show the **(cached)** tag next to weather data (0:55)
13. **End Recording** (1:00)

### Video Recording Tips:
- Use screen recording feature on your Android device
- Keep device in portrait mode
- Ensure good lighting if recording screen with camera
- Speak clearly if adding narration (optional)
- Edit to keep under 60 seconds

---

## Screenshot Checklist for Report

### Screenshot 1: Main UI with Live Data
Capture showing:
- ✅ Student index input (224044P)
- ✅ Computed coordinates (7.20, 83.00)
- ✅ Current weather data
- ✅ Last updated timestamp
- ✅ Request URL at bottom (zoom/crop if needed)

### Screenshot 2: Cached Data State
Capture showing:
- ✅ Error message (red card)
- ✅ Weather data with **(cached)** tag
- ✅ Previous timestamp maintained

---

## Understanding Your Coordinates

**Your Index**: 224044P

**Calculation**:
- First two digits: **22**
- Next two digits: **40**
- Latitude = 5 + (22 / 10.0) = 5 + 2.2 = **7.20°**
- Longitude = 79 + (40 / 10.0) = 79 + 4.0 = **83.00°**

**Location**: These coordinates point to a location in Sri Lanka (Eastern Province region).

---

## Troubleshooting

### Problem: Dependencies won't install
**Solution**: 
```powershell
flutter clean
flutter pub get
```

### Problem: App won't run on device
**Solution**: 
1. Check USB debugging is enabled on Android device
2. Run: `flutter doctor` to check for issues
3. Try: `flutter devices` to list connected devices

### Problem: API not returning data
**Solution**: 
1. Check internet connection
2. Verify the request URL is correct
3. Try visiting the URL in a browser first
4. Check if Open-Meteo is accessible from your network

### Problem: Cache not working
**Solution**: 
1. Fetch weather data successfully at least once
2. Verify shared_preferences is installed correctly
3. Check app permissions in device settings

---

## Report Template

### Section 1: Student Information
- **Name**: [Your Name]
- **Index Number**: 224044P
- **Date**: [Current Date]

### Section 2: Formula and Coordinates
- **Formula Used**:
  ```
  firstTwo = 22 (from index 224044P)
  nextTwo = 40 (from index 224044P)
  latitude = 5 + (22 / 10.0) = 7.20
  longitude = 79 + (40 / 10.0) = 83.00
  ```
- **Computed Coordinates**: (7.20, 83.00)

### Section 3: Screenshots
[Insert Screenshot 1 - Online Mode]
Caption: Weather data fetched successfully with request URL visible

[Insert Screenshot 2 - Offline Mode]
Caption: Cached data displayed when offline with (cached) tag

### Section 4: Request URL
```
https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true
```

### Section 5: Reflection (3-5 sentences)
Example:
"This project provided hands-on experience with REST API integration in Flutter mobile applications. I learned how to parse JSON responses and implement error handling for network requests. The offline caching feature using shared_preferences demonstrated the importance of offline-first architecture in mobile apps. Managing asynchronous operations and state management in Flutter was initially challenging but became clearer through implementation. Overall, the project enhanced my understanding of creating responsive and user-friendly mobile interfaces that gracefully handle network connectivity issues."

---

## Project Submission Checklist

### Files to Submit:
- [ ] **project_224044P.zip** - Complete Flutter project folder
- [ ] **report_224044P.pdf** - 2-page report with screenshots
- [ ] **video_224044P.mp4** - 60-second demo video

### Zip the Project:
1. Close Android Studio / VS Code
2. Navigate to parent directory
3. Right-click "Personalized-Weather-Dashboard" folder
4. Select "Send to" → "Compressed (zipped) folder"
5. Rename to: **project_224044P.zip**

### Before Submitting:
- [ ] Test the app works on physical device
- [ ] Verify all screenshots are clear and show required elements
- [ ] Confirm video is under 60 seconds
- [ ] Check report is maximum 2 pages
- [ ] Verify request URL is visible in screenshots
- [ ] Ensure video shows both online and offline modes
- [ ] Review reflection is 3-5 sentences
- [ ] Confirm all files are named correctly with your index

---

## Additional Notes

### Weather Code Reference
The weather code returned is a WMO code:
- 0: Clear sky
- 1-3: Partly cloudy
- 45-48: Fog
- 51-67: Rain (various intensities)
- 71-77: Snow
- 80-99: Rain showers / Thunderstorms

### API Response Example
```json
{
  "current_weather": {
    "temperature": 28.5,
    "windspeed": 12.3,
    "weathercode": 0,
    "time": "2025-11-15T10:30"
  }
}
```

---

## Good Luck!

Remember to:
1. Test thoroughly before recording
2. Take clear screenshots
3. Keep video concise and focused
4. Explain your work clearly in the report
5. Be prepared for viva questions about your implementation

For questions during viva, be ready to explain:
- How you calculated coordinates from index
- How you handle API errors
- How caching works with shared_preferences
- Why you chose certain UI elements
- How you parse JSON responses
