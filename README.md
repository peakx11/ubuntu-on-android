# Udroid Ubuntu Installer & Fixer for Android

Run a full Ubuntu Desktop (XFCE/GNOME) natively on Android using Termux and Udroid. This repository provides automated, optimized scripts to handle dependencies, fix audio issues, and bypass common display locks—no root required.

## 📥 Prerequisites
Install these two apps on your Android device before starting:
1.  **Termux** (Download from [F-Droid](https://f-droid.org/en/packages/com.termux/)) - *Do not use the Google Play Store version.*
2.  **Termux-X11** (Download from [GitHub Actions](https://github.com/termux/termux-x11/actions)) - *Install the debug APK.*

---

## ⚡ Installation (One-Time Setup)

1. Open Termux and clone this repository:
   ```bash
   pkg install git -y
   git clone [https://github.com/peakx11/ubuntu-on-android.git](https://github.com/peakx11/ubuntu-on-android.git)
   cd ubuntu-on-android
   chmod +x setup.sh launch.sh
   
