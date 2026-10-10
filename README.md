# System Resource Monitor

A Bash script for monitoring Linux system resources.

## Requirements

- Linux
- Bash
- `free`, `df`, `uptime`, and `date`

## Usage

Make the script executable:

    chmod +x script.sh

Write one report:

    ./script.sh --once

Run continuous monitoring (one report every 5 seconds):

    ./script.sh

Stop continuous monitoring with Ctrl+C.

## Configuration

The default log file is `monitor.log`.
The default interval is 5 seconds.

You can override them with environment variables:

    LOG_FILE=custom.log INTERVAL=10 ./script.sh

Each report includes a timestamp, memory usage, disk usage, and system uptime.
