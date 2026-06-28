#!/bin/bash
# All code comments are written in English as requested
# Equestria OS ISO Post-Boot WiFi Unblock Utility

if command -v rfkill &> /dev/null; then
    echo "[Equestria OS] Unblocking wireless hardware state channels via rfkill..."
    rfkill unblock wifi
    rfkill unblock all
else
    echo "[Equestria OS] Warning: rfkill binary execution target not found in path."
fi