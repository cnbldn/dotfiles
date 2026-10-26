#!/usr/bin/env bash

# If tun0 is gone or the process is dead
if [ ! -d /sys/class/net/tun0 ] || (! pgrep -x "gpclient" >/dev/null && ! pgrep -x "openconnect" >/dev/null); then
    # Output an empty space so Dank Actions flushes its cache and blanks the bar
    echo " "
    exit 0
fi

# Connected output with non-breaking space
printf "󰖂\u00a0sslvpn\n"
# ... rest of your script ...

# --- FEATURE TOGGLES (set to true/false) ---
SHOW_ICON=true
SHOW_HOST=true      # Short gateway name (e.g. sslvpn) or full domain
SHOW_UPTIME=true    # How long the VPN session has been active (e.g. 14m, 2h)
SHOW_TRAFFIC=false  # Total transferred data (e.g. 24M)

PARTS=()

# 1. VPN Icon
if [ "$SHOW_ICON" = true ]; then
    PARTS+=("󰖂")
fi

# 2. Hostname / Server Name
if [ "$SHOW_HOST" = true ]; then
    # Extracts the remote gateway IP from the routing table and reverse-resolves it,
    # or falls back to your hardcoded university gateway name:
    GATEWAY="sslvpn"
    # Alternative: set GATEWAY="sabanci" or GATEWAY="sslvpn.sabanciuniv.edu"
    PARTS+=("$GATEWAY")
fi

# 3. Connection Uptime
if [ "$SHOW_UPTIME" = true ]; then
    # Get creation time of tun0 from /sys
    IFACE_TIME=$(stat -c %Z /sys/class/net/tun0 2>/dev/null)
    NOW=$(date +%s)
    SECS=$((NOW - IFACE_TIME))

    if [ "$SECS" -ge 3600 ]; then
        UPTIME="$((SECS / 3600))h$(((SECS % 3600) / 60))m"
    elif [ "$SECS" -ge 60 ]; then
        UPTIME="$((SECS / 60))m"
    else
        UPTIME="${SECS}s"
    fi
    PARTS+=("⏱ $UPTIME")
fi

# 4. Total Traffic Transferred (RX + TX)
if [ "$SHOW_TRAFFIC" = true ]; then
    RX=$(cat /sys/class/net/tun0/statistics/rx_bytes 2>/dev/null || echo 0)
    TX=$(cat /sys/class/net/tun0/statistics/tx_bytes 2>/dev/null || echo 0)
    TOTAL=$((RX + TX))
    
    # Format to human-readable (KiB / MiB / GiB)
    if [ "$TOTAL" -ge 1073741824 ]; then
        TRAFFIC="$(awk "BEGIN {printf \"%.1fG\", $TOTAL/1073741824}")"
    elif [ "$TOTAL" -ge 1048576 ]; then
        TRAFFIC="$((TOTAL / 1048576))M"
    else
        TRAFFIC="$((TOTAL / 1024))K"
    fi
    PARTS+=("󰹹 $TRAFFIC")
fi

# Output combined string (e.g. "󰖂 sslvpn ⏱ 12m")
echo "${PARTS[*]}"
