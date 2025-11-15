# SUBMISSION CHECKLIST
## Student Index: 224044P

---

## 📋 Required Deliverables

### 1. project_224044P.zip ✅
**What to include:**
- Complete Flutter project folder
- All source code files
- Configuration files (pubspec.yaml, AndroidManifest.xml, etc.)
- Documentation files (README.md, SETUP_GUIDE.md)

**How to create:**
1. Close all editors/IDEs
2. Navigate to: `d:\L3S1\Wireless`
3. Right-click `Personalized-Weather-Dashboard` folder
4. Select "Send to" → "Compressed (zipped) folder"
5. Rename to: `project_224044P.zip`

---

### 2. report_224044P.pdf ✅
**Maximum: 2 pages**

**Required Content:**

#### Page 1:
**Header:**
- Student Name: [Your Name]
- Index Number: 224044P
- Course: [Course Name]
- Date: November 15, 2025

**Section 1: Formula and Coordinates**
```
Index: 224044P

Calculation:
- firstTwo = 22 (digits 0-1)
- nextTwo = 40 (digits 2-3)
- Latitude = 5 + (22 / 10.0) = 7.20°
- Longitude = 79 + (40 / 10.0) = 83.00°

Final Coordinates: (7.20°N, 83.00°E)
Location: Eastern Province, Sri Lanka
```

**Section 2: Request URL**
```
https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true
```

**Section 3: Screenshots**
- Screenshot 1: Online mode with weather data and visible URL
- Screenshot 2: Offline mode showing error + cached data with "(cached)" tag

#### Page 2:

**Section 4: Implementation Details**
Brief bullet points:
- Flutter framework with Material Design
- HTTP package for REST API calls
- shared_preferences for local caching
- JSON parsing for API response
- Error handling and loading states
- Offline-first architecture

**Section 5: Reflection (3-5 sentences)**
Example:
"This project provided comprehensive experience in Flutter mobile development and REST API integration. I learned to handle asynchronous operations, parse JSON responses, and implement proper error handling for network requests. The offline caching feature using shared_preferences demonstrated the importance of resilient mobile applications that function gracefully without internet connectivity. Managing state and UI updates based on API responses enhanced my understanding of Flutter's reactive framework. The project successfully demonstrates practical application of the request-response cycle in mobile development."

---

### 3. video_224044P.mp4 ✅
**Maximum: 60 seconds**

**Script Timeline:**

| Time | Action | What to Show |
|------|--------|--------------|
| 0:00-0:05 | Open app | Main screen visible |
| 0:05-0:10 | Point to index | "224044P" in text field |
| 0:10-0:15 | Show coordinates | Lat: 7.20, Lon: 83.00 |
| 0:15-0:20 | Scroll down | Request URL visible at bottom |
| 0:20-0:25 | Tap "Fetch Weather" | Loading indicator appears |
| 0:25-0:35 | Show results | Temperature, wind, weather code, timestamp |
| 0:35-0:42 | Enable Airplane Mode | Swipe down notification panel, toggle on |
| 0:42-0:48 | Return to app | Tap "Fetch Weather" again |
| 0:48-0:55 | Show error | Red error card appears |
| 0:55-0:60 | Show cached data | Scroll to see "(cached)" tag |

**Recording Tips:**
- Use Android's built-in screen recorder
- Keep phone in portrait orientation
- Ensure good screen brightness
- Practice the flow before final recording
- Trim video to exactly 60 seconds or less
- Save as: `video_224044P.mp4`

---

## 🧪 Testing Checklist

### Before Recording Video:

#### Test 1: Online Functionality
- [ ] App launches without errors
- [ ] Index "224044P" is visible
- [ ] Coordinates show: Lat 7.20, Lon 83.00
- [ ] "Fetch Weather" button is clickable
- [ ] Loading indicator appears when fetching
- [ ] Weather data displays correctly (temp, wind, code)
- [ ] Timestamp shows current date/time
- [ ] Request URL is visible at bottom

#### Test 2: Offline Functionality
- [ ] Fetch data successfully first (online)
- [ ] Enable Airplane Mode
- [ ] Tap "Fetch Weather" again
- [ ] Error message appears (red card)
- [ ] Previous data still visible
- [ ] "(cached)" tag appears
- [ ] All cached values match previous fetch

#### Test 3: UI/UX
- [ ] All labels are readable
- [ ] Layout is clean and organized
- [ ] Cards have proper spacing
- [ ] Icons are appropriate
- [ ] Colors are professional
- [ ] Text is properly aligned

---

## 📸 Screenshot Requirements

### Screenshot 1: Online Mode (Full Success State)
**Must show:**
- ✅ Student index: 224044P
- ✅ Computed coordinates: 7.20, 83.00
- ✅ Current weather data with values
- ✅ Last updated timestamp
- ✅ Request URL at bottom (entire URL visible)

**How to capture:**
1. Fetch weather successfully
2. Scroll if needed to show URL
3. Take screenshot (Power + Volume Down)
4. Verify URL is readable

### Screenshot 2: Offline/Cached State
**Must show:**
- ✅ Error message in red card
- ✅ Weather data still displayed
- ✅ "(cached)" tag next to "Current Weather"
- ✅ Same timestamp as before (proving it's cached)

**How to capture:**
1. Enable Airplane Mode
2. Tap "Fetch Weather"
3. Wait for error to appear
4. Take screenshot showing error + cached data

---

## 📊 Marking Rubric Self-Check

| Area | Points | Status |
|------|--------|--------|
| Correct index→coords & shown in UI | 15 | ✅ |
| Working API call & JSON parsing | 25 | ✅ |
| Loading, error handling, offline cache | 25 | ✅ |
| Clean UI (labels, layout, readability) | 15 | ✅ |
| Report (clear + screenshots + URL) | 10 | ⏳ |
| Video demo (≤60s, shows online + cached) | 10 | ⏳ |
| **TOTAL** | **100** | |

---

## 🎯 Viva Preparation Questions

Be ready to explain:

1. **Coordinate Calculation:**
   - Q: "How did you derive latitude and longitude from your index?"
   - A: Explain the formula with your specific numbers (22, 40)

2. **API Integration:**
   - Q: "Which API did you use and why?"
   - A: Open-Meteo, no API key required, simple JSON response

3. **Error Handling:**
   - Q: "How does your app handle network errors?"
   - A: Try-catch blocks, show error message, fallback to cached data

4. **Caching Mechanism:**
   - Q: "How did you implement offline caching?"
   - A: shared_preferences stores last successful result, loads on error

5. **JSON Parsing:**
   - Q: "How do you parse the API response?"
   - A: json.decode(), access current_weather object, extract fields

6. **State Management:**
   - Q: "How do you update the UI with new data?"
   - A: setState() triggers rebuild with new values

7. **UI Design:**
   - Q: "Why did you choose this layout?"
   - A: Card-based design for clarity, icons for visual cues, color coding for states

---

## ✅ Final Submission Steps

### Day Before Submission:
1. [ ] Test app thoroughly on physical device
2. [ ] Take both required screenshots
3. [ ] Record and edit video (check duration)
4. [ ] Prepare report template
5. [ ] Practice viva explanations

### Submission Day:
1. [ ] Create project_224044P.zip
2. [ ] Finalize report_224044P.pdf
3. [ ] Verify video_224044P.mp4 (≤60s)
4. [ ] Check all files are named correctly
5. [ ] Verify file sizes are reasonable
6. [ ] Submit through proper channel
7. [ ] Keep backup copies

---

## 📝 Quick Reference

**Your Coordinates:**
- Latitude: 7.20°
- Longitude: 83.00°

**Your API URL:**
```
https://api.open-meteo.com/v1/forecast?latitude=7.20&longitude=83.00&current_weather=true
```

**Your Index:** 224044P

**Key Files Location:**
- Source code: `lib/main.dart`
- Dependencies: `pubspec.yaml`
- Setup guide: `SETUP_GUIDE.md`
- This checklist: `SUBMISSION_CHECKLIST.md`

---

## 🆘 Need Help?

### Common Issues:

**Problem:** App not running
**Solution:** 
```powershell
flutter clean
flutter pub get
flutter run
```

**Problem:** Dependencies error
**Solution:** Delete `pubspec.lock`, run `flutter pub get`

**Problem:** Device not detected
**Solution:** Enable USB debugging, check `flutter devices`

**Problem:** API not responding
**Solution:** Check internet, try URL in browser first

---

## 🎓 Success Tips

1. **Start Early:** Don't wait until last minute
2. **Test Thoroughly:** Try all scenarios multiple times
3. **Clear Screenshots:** Make sure URL is readable
4. **Concise Video:** Practice to stay under 60 seconds
5. **Proofread Report:** Check spelling and formatting
6. **Understand Code:** Be ready to explain every part
7. **Keep Backup:** Save all files in multiple locations

---

**Good Luck! 🍀**

Remember: Quality over quantity. A working app with clear documentation beats an elaborate app with bugs!
