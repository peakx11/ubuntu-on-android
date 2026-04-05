#!/usr/bin/env bash
# ==========================================
# Ubuntu Start Script (with Audio & Fixes)
# Refactored for Safety & Performance
# ==========================================

# Configuration Variables
UDROID_SUITE="jammy:xfce4"

echo "[*] Cleaning up old X11 lock files..."
# Safely kill the display server only if it's running
if pgrep -x "termux-x11" > /dev/null; then
    killall termux-x11 2>/dev/null || true
    sleep 1
fi
rm -rf /tmp/.X11-unix /tmp/.X*-lock

echo "[*] Checking PulseAudio..."
# Only start PulseAudio if it isn't already running
if ! pulseaudio --check; then
    echo "    Starting PulseAudio server..."
    # Safely apply the audio fix only if the library exists on this device
    if [ -f "/system/lib64/libskcodec.so" ]; then
        export LD_PRELOAD=/system/lib64/libskcodec.so
    fi
    pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
else
    echo "    PulseAudio is already running."
fi

echo "[*] Starting Termux-X11 Display Server..."
termux-x11 :0 -ac &

# Wait dynamically for X11 to start rather than using a blind sleep timer
timeout=5
while [ ! -e /tmp/.X11-unix/X0 ] && [ $timeout -gt 0 ]; do
    sleep 1
    timeout=$((timeout - 1))
done

if [ ! -e /tmp/.X11-unix/X0 ]; then
    echo "⚠️ Warning: X11 socket not found. The display might crash."
fi

echo "======================================================"
echo "🚀 Logging into Ubuntu ($UDROID_SUITE)..."
echo "IMPORTANT: Once inside, run this to start the desktop:"
echo " "
echo "  export DISPLAY=:0 PULSE_SERVER=127.0.0.1 && startxfce4"
echo "======================================================"

udroid login $UDROID_SUITE
