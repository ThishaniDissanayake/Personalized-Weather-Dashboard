# Flutter Run Script for Weather Dashboard
# Student Index: 224044P

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Weather Dashboard Setup & Run" -ForegroundColor Cyan
Write-Host "  Student Index: 224044P" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Flutter is installed
Write-Host "Checking Flutter installation..." -ForegroundColor Yellow
$flutterCheck = flutter --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Flutter is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Flutter from https://flutter.dev" -ForegroundColor Red
    pause
    exit 1
}
Write-Host "Flutter is installed!" -ForegroundColor Green
Write-Host ""

# Run Flutter Doctor
Write-Host "Running Flutter Doctor..." -ForegroundColor Yellow
flutter doctor
Write-Host ""

# Get dependencies
Write-Host "Installing dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to get dependencies" -ForegroundColor Red
    pause
    exit 1
}
Write-Host "Dependencies installed successfully!" -ForegroundColor Green
Write-Host ""

# Check for connected devices
Write-Host "Checking for connected devices..." -ForegroundColor Yellow
flutter devices
Write-Host ""

# Ask user if they want to run the app
$response = Read-Host "Do you want to run the app now? (y/n)"
if ($response -eq "y" -or $response -eq "Y") {
    Write-Host ""
    Write-Host "Starting the app..." -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    flutter run
} else {
    Write-Host ""
    Write-Host "Setup complete! Run 'flutter run' when ready." -ForegroundColor Green
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Remember to test both online and offline modes!" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
pause
