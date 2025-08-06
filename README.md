# nids-rpi5
NIDS Project on Raspberry Pi 5
---
## Phase 1: Initial Setup and Environment Preparation

### Goals:
- Prepare the Raspberry Pi 5 to run a lightweight NIDS
- Install and configure Suricata for the first time
- Validate traffic capture using default Suricata rules

### Setup Steps:
- Flashed Kali Linux ARM64 onto Raspberry Pi 5
- Connected to Wi-Fi (`wlan0`)
- Installed Suricata with `sudo apt install suricata`
- Verified Suricata installation and service status
- Manually ran Suricata to begin packet inspection:

## Phase 2: Real-Time Alerting and Logging

### Goals:
- Enable Suricata to monitor network traffic on the Raspberry Pi
- Create a real-time alert monitor script (`alert_monitor.sh`)
- Log alerts with timestamps and IPs
- Store sample logs for review and documentation
- Commit all related files to GitHub and document the setup

### Files:
- `/scripts/alert_monitor.sh` - Bash script for real-time JSON alert monitoring
- `/logs/nids_alert_log_sample.txt` - Sample log file with Suricata alert output

### Test Methods:
- Simulated ICMP traffic using `ping`
- Triggered known alert with `curl http://testmyids.com`

### Outcome:
Real-time alerting confirmed to be functional. Logs are generated and stored with proper timestamps and alert content. GitHub repository structure was established and all relevant files were committed. Ready for custom rule creation in Phase 3.

