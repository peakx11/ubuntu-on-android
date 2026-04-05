#!/usr/bin/env bash
# ==========================================
# Udroid Installer & Setup Script
# Refactored for Safety & Performance
# ==========================================
set -e # Exit immediately if a command fails

echo "[*] Updating packages and installing dependencies..."
# Combined package installations to reduce apt overhead
pkg update -y && pkg upgrade -y
pkg install x11-repo -y
pkg install termux-x11-nightly proot pulseaudio git -y

echo "[*] Downloading Official Udroid Installer..."
# Safety: Cloning the official repo instead of running a masked bit.ly link
if [ ! -d "fs-manager-udroid" ]; then
    git clone https://github.com/RandomCoderOrg/fs-manager-udroid
fi

cd fs-manager-udroid || exit 1
bash install.sh

echo " "
echo "======================================================"
echo "✅ Udroid CLI Installed Successfully!"
echo "To install the Ubuntu Desktop, run:"
echo "  udroid install jammy:xfce4"
echo " "
echo "After installation, use 'launch.sh' to start the desktop."
echo "======================================================"
