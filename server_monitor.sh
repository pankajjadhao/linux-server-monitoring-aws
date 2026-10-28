
#!/bin/bash

LOG_FILE="$HOME/linux-monitor-project/server_monitor.log"

# Create the log directory if it does not exist
mkdir -p "$(dirname "$LOG_FILE")"

# Thresholds
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

{
    echo
    echo "===================================="
    echo "Server Health Report: $(date)"
    echo "Hostname: $(hostname)"
    echo "===================================="

    echo
    echo "---- Uptime ----"
    uptime

    echo
    echo "---- Memory Usage ----"
    free -h

    echo
    echo "---- Disk Usage ----"
    df -h /

    echo
    echo "---- Top CPU Processes ----"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
} >> "$LOG_FILE" || {
    echo "ERROR: Could not write the monitoring report."
    exit 1
}

# Check root disk usage
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage is ${DISK_USAGE}%!"
else
    echo "OK: Disk usage is ${DISK_USAGE}%."
fi

# Check memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')

if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "WARNING: Memory usage is ${MEMORY_USAGE}%!"
else
    echo "OK: Memory usage is ${MEMORY_USAGE}%."
fi

echo "Monitoring completed."
echo "Full report: $LOG_FILE"

