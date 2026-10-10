#!/usr/bin/env bash

set -u

LOG_FILE="${LOG_FILE:-monitor.log}"
INTERVAL="${INTERVAL:-5}"

if ! [[ "$INTERVAL" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: INTERVAL must be a positive integer" >&2
    exit 1
fi

write_report() {
    if ! {
        echo "===== $(date '+%Y-%m-%d %H:%M:%S') ====="
        echo "--- Memory ---"
        free -h
        echo "--- Disk ---"
        df -h
        echo "--- Uptime ---"
        uptime
        echo
    } >> "$LOG_FILE"; then
        echo "Error: cannot write to $LOG_FILE" >&2
        return 1
    fi
}

if [[ "${1:-}" == "--once" ]]; then
    write_report || exit 1
    echo "Report saved to $LOG_FILE"
    exit 0
elif [[ $# -gt 0 ]]; then
    echo "Usage: $0 [--once]" >&2
    exit 1
fi

while true; do
    write_report || exit 1
    sleep "$INTERVAL"
done
