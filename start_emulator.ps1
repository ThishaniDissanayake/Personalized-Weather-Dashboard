# Android Emulator Quick Start Guide
# Student Index: 224044P

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Android Emulator Setup & Run" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Flutter is working
Write-Host "Checking Flutter..." -ForegroundColor Yellow
flutter doctor
Write-Host ""

# List available AVDs
Write-Host "Checking for available Android emulators..." -ForegroundColor Yellow
$avds = emulator -list-avds 2>&1

if ($avds) {
    Write-Host "Available emulators:" -ForegroundColor Green
    Write-Host $avds
    Write-Host ""
    
    # Ask user to select or start emulator manually
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Please start your emulator using ONE of these methods:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "METHOD 1: Start from Android Studio" -ForegroundColor White
    Write-Host "  1. Open Android Studio" -ForegroundColor Gray
    Write-Host "  2. Click 'Device Manager' (phone icon on right side)" -ForegroundColor Gray
    Write-Host "  3. Click the Play button next to your device" -ForegroundColor Gray
    Write-Host ""
    Write-Host "METHOD 2: Start from command line" -ForegroundColor White
    Write-Host "  Run: emulator -avd YOUR_EMULATOR_NAME" -ForegroundColor Gray
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
} else {
    Write-Host "No Android emulators found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "To create an emulator:" -ForegroundColor Yellow
    Write-Host "  1. Open Android Studio" -ForegroundColor White
    Write-Host "  2. Click 'More Actions' -> 'Virtual Device Manager'" -ForegroundColor White
    Write-Host "  3. Click 'Create Device'" -ForegroundColor White
    Write-Host "  4. Select 'Pixel 5' (or any phone)" -ForegroundColor White
    Write-Host "  5. Download system image (API 33 recommended)" -ForegroundColor White
    Write-Host "  6. Click 'Finish'" -ForegroundColor White
    Write-Host "  7. Click Play button to start" -ForegroundColor White
    Write-Host ""
}

# Wait for user to start emulator
Write-Host "Waiting for device to be ready..." -ForegroundColor Yellow
Write-Host "Press Enter after you've started the emulator..." -ForegroundColor Cyan
Read-Host

# Check for connected devices
Write-Host ""
Write-Host "Checking for connected devices..." -ForegroundColor Yellow
flutter devices
Write-Host ""

$response = Read-Host "Is your emulator visible above? (y/n)"
if ($response -eq "y" -or $response -eq "Y") {
    Write-Host ""
    Write-Host "Great! Starting the Weather Dashboard app..." -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "The app will launch with your index: 224044P" -ForegroundColor Yellow
    Write-Host "Coordinates: Lat 7.20, Lon 83.00" -ForegroundColor Yellow
    Write-Host ""
    flutter run
} else {
    Write-Host ""
    Write-Host "Troubleshooting steps:" -ForegroundColor Yellow
    Write-Host "1. Make sure Android Studio is installed" -ForegroundColor White
    Write-Host "2. Create an emulator (see instructions above)" -ForegroundColor White
    Write-Host "3. Start the emulator and wait for it to fully boot" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Need help? Check SETUP_GUIDE.md" -ForegroundColor Cyan
    Write-Host ""
}

pause
