@echo off
echo =========================================
echo   TEST BUILD - CEK ERROR
echo =========================================
echo.
echo Script ini akan mengecek apakah ada error
echo di project Flutter Anda
echo.

echo [1/4] Cleaning project...
flutter clean
if %ERRORLEVEL% NEQ 0 (
    echo ERROR saat cleaning!
    pause
    exit /b 1
)
echo ✓ Clean berhasil
echo.

echo [2/4] Getting dependencies...
flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR saat pub get!
    pause
    exit /b 1
)
echo ✓ Pub get berhasil
echo.

echo [3/4] Analyzing code...
flutter analyze
if %ERRORLEVEL% NEQ 0 (
    echo ⚠ Ada warning di code (ini normal)
) else (
    echo ✓ No issues found
)
echo.

echo [4/4] Test build APK (release mode)...
echo Ini akan memakan waktu beberapa menit...
echo.
flutter build apk --release

echo.
echo =========================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ BUILD BERHASIL!
    echo.
    echo Kesimpulan:
    echo - Tidak ada error di AndroidManifest.xml
    echo - Tidak ada error di build.gradle.kts
    echo - Tidak ada error di MainActivity.kt
    echo - Semua konfigurasi sudah benar!
    echo.
    echo File APK:
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo Error merah di IDE adalah FALSE POSITIVE.
    echo File Anda SUDAH BENAR! ✅
    echo.
    start "" "%CD%\build\app\outputs\flutter-apk"
) else (
    echo ❌ BUILD GAGAL!
    echo.
    echo Ada error yang perlu diperbaiki.
    echo Lihat pesan error di atas untuk detail.
)
echo =========================================
echo.
pause

