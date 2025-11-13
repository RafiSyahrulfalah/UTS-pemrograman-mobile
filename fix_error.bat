@echo off
echo =========================================
echo   FIX REDECLARATION ERROR
echo =========================================
echo.
echo Memperbaiki error "Redeclaration: class MainActivity"
echo.

echo [1/5] Menghapus file MainActivity.kt yang lama...
echo Lokasi: com\example\tugas_flutter\MainActivity.kt
if exist "android\app\src\main\kotlin\com\example" (
    rd /s /q "android\app\src\main\kotlin\com\example"
    echo ✓ Folder lama dihapus
) else (
    echo ✓ Folder lama sudah tidak ada
)
echo.

echo [2/5] Verifikasi MainActivity.kt yang baru ada...
if exist "android\app\src\main\kotlin\com\rafi\tugas_flutter\MainActivity.kt" (
    echo ✓ MainActivity.kt baru ada di lokasi yang benar
) else (
    echo ✗ MainActivity.kt baru tidak ditemukan!
    echo ERROR: File MainActivity.kt tidak ditemukan
    pause
    exit /b 1
)
echo.

echo [3/5] Cleaning build cache...
flutter clean
if %ERRORLEVEL% NEQ 0 (
    echo ERROR saat cleaning!
    pause
    exit /b 1
)
echo ✓ Clean berhasil
echo.

echo [4/5] Getting dependencies...
flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR saat pub get!
    pause
    exit /b 1
)
echo ✓ Pub get berhasil
echo.

echo [5/5] Test build...
echo Membangun aplikasi untuk memastikan error sudah teratasi...
echo.
flutter build apk --release

echo.
echo =========================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ BUILD BERHASIL!
    echo.
    echo Error "Redeclaration" sudah teratasi!
    echo.
    echo File APK berhasil dibuat:
    echo %CD%\build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo Membuka folder APK...
    start "" "%CD%\build\app\outputs\flutter-apk"
) else (
    echo ❌ BUILD MASIH GAGAL!
    echo.
    echo Silakan cek error di atas.
    echo Mungkin ada masalah lain yang perlu diperbaiki.
)
echo =========================================
echo.
pause

