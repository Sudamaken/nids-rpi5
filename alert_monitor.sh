#!/bin/bash

LOG_FILE="$HOME/nids_alert_log.txt"

echo "[*] NIDS Real-Time Alert Monitor"
echo "[*] Writing alerts to: $LOG_FILE"
echo "[*] Monitoring started at $(date)" >> "$LOG_FILE"

tail -Fn0 /var/log/suricata/eve.json | \
while read line; do
	if echo "$line" | jq -e 'select(.alert)' > /dev/null; then
		ALERT_SIG=$(echo "$line" | jq -r '.alert.signature')
		SRC_IP=$(echo "$line" | jq -r '.src_ip // empty')
		DST_IP=$(echo "$line" | jq -r '.dest_ip // empty')
		TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
		
		echo "[ALERT] $TIMESTAMP: $ALERT_SIG | $SRC_IP -> $DST_IP"
		echo "$TIMESTAMP: $ALERT_SIG | $SRC_IP -> $DST_IP" >> "$LOG_FILE"
	fi
done

