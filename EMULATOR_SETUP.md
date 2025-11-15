# ANDROID EMULATOR SETUP GUIDE
## For Student Index: 224044P

---

## 🎯 Goal
Run the Weather Dashboard app on Android Studio's emulator

---

## 📋 Prerequisites

### 1. Check if Android Studio is installed
- Open Android Studio
- If not installed, download from: https://developer.android.com/studio

### 2. Check if Flutter recognizes Android Studio
```powershell
flutter doctor
```

Look for:
- ✅ Android toolchain (should have green checkmark)
- ✅ Android Studio (should have green checkmark)

If you see ❌, you may need to accept Android licenses:
```powershell
flutter doctor --android-licenses
```
(Press 'y' to accept all)

---

## 🚀 Method 1: Using Android Studio GUI (Easiest!)

### Step 1: Open Device Manager
1. **Open Android Studio**
2. On the welcome screen, click **"More Actions"**
3. Select **"Virtual Device Manager"**

   OR if project is open:
   - Look for the **phone icon** on the right toolbar
   - Click **"Device Manager"**

### Step 2: Check for Existing Emulators
- If you see devices listed → **Skip to Step 4**
- If list is empty → **Continue to Step 3**

### Step 3: Create New Emulator (If needed)
1. Click **"Create Device"** button (+ icon)
2. **Select Hardware:**
   - Category: **Phone**
   - Device: **Pixel 5** (recommended)
   - Click **"Next"**

3. **Select System Image:**
   - Tab: **Recommended**
   - Select: **Tiramisu (API 33)** or **S (API 31)**
   - If not downloaded, click **"Download"** next to it
   - Wait for download to complete
   - Click **"Next"**

4. **Verify Configuration:**
   - AVD Name: `Pixel_5_API_33` (or keep default)
   - Click **"Finish"**

### Step 4: Start the Emulator
1. In Device Manager, find your emulator
2. Click the **▶ Play button** (green triangle)
3. **Wait 1-2 minutes** for emulator to fully boot
4. You'll see the Android home screen

### Step 5: Run Your Flutter App
Open PowerShell in your project folder and run:
```powershell
flutter devices
```

You should see something like:
```
Android SDK built for x86 (mobile) • emulator-5554 • android-x86 • Android 13 (API 33)
```

Now run the app:
```powershell
flutter run
```

---

## 🚀 Method 2: Using Command Line

### Check Available Emulators
```powershell
emulator -list-avds
```

### Start a Specific Emulator
```powershell
# Replace 'Pixel_5_API_33' with your emulator name
emulator -avd Pixel_5_API_33
```

### Or Use Our Helper Script
```powershell
.\start_emulator.ps1
```

---

## 🚀 Method 3: Using VS Code (If you have Flutter extension)

1. **Open VS Code**
2. Open project folder: `Personalized-Weather-Dashboard`
3. Press **Ctrl+Shift+P** (Command Palette)
4. Type: **"Flutter: Select Device"**
5. Choose: **"Start iOS Simulator"** or **"Start Android Emulator"**
6. Press **F5** to run

---

## 🔍 Verify Device is Connected

Run this command:
```powershell
flutter devices
```

**Expected Output:**
```
3 connected devices:

Pixel 5 API 33 (mobile) • emulator-5554 • android-x86 • Android 13 (API 33) (emulator)
```

---

## ▶️ Run the App

Once you see your emulator in `flutter devices`:

```powershell
flutter run
```

### What happens next:
1. **Building...** (30-60 seconds first time)
2. **Installing...** (10-20 seconds)
3. **App launches** on emulator
4. You'll see the Weather Dashboard with index **224044P**

---

## 🎮 Hot Reload Tips

While the app is running in the terminal:
- Press **`r`** → Hot reload (fast updates)
- Press **`R`** → Hot restart (full restart)
- Press **`q`** → Quit app

---

## ❌ Troubleshooting

### Problem: No emulators found
**Solution:**
```powershell
# Open Android Studio and create one (see Method 1)
```

### Problem: Emulator won't start
**Solution:**
1. Check BIOS: Enable **Intel VT-x** or **AMD-V** (virtualization)
2. Disable Hyper-V (Windows):
   ```powershell
   bcdedit /set hypervisorlaunchtype off
   ```
   (Restart computer)

### Problem: "flutter devices" shows nothing
**Solution:**
```powershell
# Wait for emulator to fully boot (1-2 minutes)
# You should see the Android home screen

# Then try again:
flutter devices
```

### Problem: Build failed
**Solution:**
```powershell
flutter clean
flutter pub get
flutter run
```

### Problem: Emulator is too slow
**Solutions:**
- Use **x86** system image (not ARM)
- Increase RAM in Device Manager: **Edit** → **Advanced** → RAM: 2048 MB
- Enable **Hardware acceleration** in BIOS

---

## 📱 Alternative: Use Physical Android Device

If emulator is slow, use your phone:

### Enable Developer Options:
1. **Settings** → **About Phone**
2. Tap **"Build Number"** 7 times
3. Go back → **Developer Options** now appears

### Enable USB Debugging:
1. **Settings** → **Developer Options**
2. Enable **"USB Debugging"**

### Connect Phone:
1. Connect USB cable to computer
2. On phone, allow debugging prompt
3. Run: `flutter devices`
4. Run: `flutter run`

---

## ✅ Quick Start Commands

```powershell
# Navigate to project
cd "D:\L3S1\Wireless\Personalized-Weather-Dashboard"

# Check devices
flutter devices

# If emulator is running, launch app
flutter run

# Or use helper script
.\start_emulator.ps1
```

---

## 🎥 For Video Recording

### Android Emulator Built-in Recording:
1. Look for **3 dots** (⋮) on emulator sidebar
2. Click **"Record screen"**
3. Start recording
4. Do your demo
5. Stop recording
6. Video saved to desktop

### Or Use OBS Studio:
- Free screen recording software
- Can record emulator screen
- Download: https://obsproject.com/

---

## 🎯 Your App Details

Once running, you'll see:
- **Index:** 224044P
- **Latitude:** 7.20
- **Longitude:** 83.00
- **API URL:** (at bottom of screen)

Test both:
1. **Online mode:** Tap "Fetch Weather"
2. **Offline mode:** Enable Airplane Mode in emulator

---

## 📞 Still Need Help?

Run diagnostics:
```powershell
flutter doctor -v
```

Check for issues and follow the suggestions.

---

**Good luck! 🚀**
