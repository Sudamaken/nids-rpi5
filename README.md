# nids-rpi5

Network Intrusion Detection System project built on a Raspberry Pi 5 using Suricata and Kali Linux.

---

## Phase 1: Initial Setup and Environment Preparation

### Goals:
- Prepare the Raspberry Pi 5 to run a lightweight NIDS
- Install and configure Suricata for the first time
- Validate Suricata is installed correctly

### Actions:
- Flashed Kali Linux ARM64 onto Raspberry Pi 5
- Connected to Wi-Fi (`wlan0`)
- Installed Suricata via `sudo apt install suricata`
- Verified Suricata build info and service status

---

## Phase 2: Logging and Monitoring Setup

### Goals:
- Enable Suricata to monitor traffic passively on `wlan0`
- Ensure log files are written correctly
- Create a real-time monitoring script for alert visibility

### Actions:
- Edited `suricata.yaml` to use the correct interface
- Started Suricata in daemon mode on `wlan0`
- Created `alert_monitor.sh` to filter `eve.json` with `jq`
- Symlinked logs into the project directory
- Confirmed Suricata was running and `eve.json` was updating

### Files:
- `/scripts/alert_monitor.sh` – Real-time alert filtering script
- `eve.json` symlinked to project directory
- `logs/logs.txt` – Sample log output captured during normal use

---

## Phase 3: Traffic Testing and Detection

### Goals:
- Simulate suspicious activity to trigger built-in Suricata rules
- Confirm alerts appear correctly in logs
- Use Suricata’s default signatures for testing

### Actions:
- Ran `ping testmyids.com` to trigger policy alerts
- Observed `ET POLICY External IP Lookup` and `GPL ATTACK_RESPONSE` alerts
- Spotify activity also triggered `ET INFO Spotify P2P Client` detections
- Verified alerts were logged to `eve.json` and monitored using `alert_monitor.sh`
- Stored alerts in `logs/logs.txt` for reference

Details documented in [`03_Testing_Traffic.md`](./03_Testing_Traffic.md)



