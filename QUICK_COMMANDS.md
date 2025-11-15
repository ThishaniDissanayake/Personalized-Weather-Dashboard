# QUICK COMMANDS REFERENCE
# Student Index: 224044P

## 🚀 Essential Commands

### 1. Install Dependencies
```powershell
flutter pub get
```
Run this first after opening the project!

### 2. Check Flutter Status
```powershell
flutter doctor
```
Checks if everything is set up correctly.

### 3. List Connected Devices
```powershell
flutter devices
```
Shows available devices (phone/emulator).

### 4. Run the App
```powershell
flutter run
```
Starts the app on connected device.

### 5. Build APK (Release)
```powershell
flutter build apk --release
```
Creates installable APK file.

### 6. Clean Project
```powershell
flutter clean
```
Removes build files (use if errors occur).

---

## 🔧 Troubleshooting Commands

### If dependencies fail:
```powershell
flutter clean
rm pubspec.lock
flutter pub get
```

### If app won't run:
```powershell
flutter doctor -v
flutter devices
flutter run -v
```

### To see detailed logs:
```powershell
flutter run --verbose
```

---

## 📱 Android Commands

### Check if ADB is working:
```powershell
adb devices
```

### Restart ADB:
```powershell
adb kill-server
adb start-server
```

---

## 💡 Development Tips

### Hot Reload (while app is running):
Press `r` in terminal - updates UI instantly

### Hot Restart (while app is running):
Press `R` in terminal - restarts app

### Quit app:
Press `q` in terminal

---

## 📦 Building for Submission

### Build Debug APK:
```powershell
flutter build apk --debug
```
Output: `build\app\outputs\flutter-apk\app-debug.apk`

### Build Release APK:
```powershell
flutter build apk --release
```
Output: `build\app\outputs\flutter-apk\app-release.apk`

---

## 🎯 Your Project Specifics

**Index:** 224044P
**Coordinates:** Lat 7.20, Lon 83.00
**API URL:** https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true

---

## 📂 Important File Locations

- **Main Code:** `lib\main.dart`
- **Dependencies:** `pubspec.yaml`
- **Android Config:** `android\app\src\main\AndroidManifest.xml`
- **Setup Guide:** `SETUP_GUIDE.md`
- **Submission List:** `SUBMISSION_CHECKLIST.md`

---

## ⚡ One-Line Setup & Run

```powershell
flutter pub get; flutter run
```

---

## 🧪 Test Your App

### Test Online Mode:
1. Ensure WiFi/data is ON
2. Run app: `flutter run`
3. Tap "Fetch Weather"
4. Verify data displays

### Test Offline Mode:
1. Fetch weather once (online)
2. Enable Airplane Mode
3. Tap "Fetch Weather"
4. Check for "(cached)" tag

---

## 📸 Screenshot Locations (on Android)

Screenshots saved to:
`/sdcard/Pictures/Screenshots/`

Transfer to PC:
```powershell
adb pull /sdcard/Pictures/Screenshots/ .
```

---

## 🎥 Video Recording (Android)

1. Swipe down notification panel
2. Find "Screen record" button
3. Tap to start recording
4. Do your demo (under 60 seconds!)
5. Tap to stop
6. Video saved in Gallery/Photos

Transfer to PC:
```powershell
adb pull /sdcard/DCIM/ScreenRecords/ .
```

---

## ✅ Pre-Submission Check

Run these commands to verify:

```powershell
# 1. Clean build
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Check for issues
flutter analyze

# 4. Run on device
flutter run

# 5. Test both online and offline modes
```

---

## 🆘 Emergency Fixes

### "Command not found: flutter"
- Add Flutter to PATH
- Restart PowerShell

### "No devices found"
- Enable USB debugging on phone
- Check cable connection
- Run: `adb devices`

### "Build failed"
```powershell
flutter clean
flutter pub get
flutter run
```

### "Gradle error"
- Delete `android\.gradle` folder
- Run: `flutter clean`
- Run: `flutter pub get`
- Run: `flutter run`

---

## 🎓 Final Checks

Before submitting:
- [ ] App runs without errors
- [ ] All features work (online/offline)
- [ ] Screenshots are clear
- [ ] Video is under 60 seconds
- [ ] Report is 2 pages max
- [ ] All files named with 224044P

---

**Quick Start:**
```powershell
cd "d:\L3S1\Wireless\Personalized-Weather-Dashboard"
flutter pub get
flutter run
```

**That's it! Good luck! 🚀**
