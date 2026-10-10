#!/usr/bin/env bash

set -u

LOG_FILE="${LOG_FILE:-monitor.log}"
INTERVAL="${INTERVAL:-5}"

write_report() {
    {
        echo "===== $(date '+%Y-%m-%d %H:%M:%S') ====="
        echo "--- Memory ---"
        free -h
        echo "--- Disk ---"
        df -h
        echo "--- Uptime ---"
        uptime
        echo
    } >> "$LOG_FILE"
}

if [[ "${1:-}" == "--once" ]]; then
    write_report
    echo "Report saved to $LOG_FILE"
    exit 0
fi

while true; do
    write_report
    sleep "$INTERVAL"
done
