# 03 – Testing Traffic

This section documents how I generated network traffic to test Suricata and verify that alerts were being logged correctly. This marks the beginning of Phase 3: traffic simulation and deeper rule customization.

## Test Method 1: Pinging a Known Suspicious Domain

To trigger a built-in Suricata rule, I used the `ping` command on a domain known to activate policy rules:

```bash
ping testmyids.com
```
### Expected Behavior
Suricata includes signatures that match outbound traffic to certain domains. Even a simple ping can resolve DNS and initiate detection.

### Example Alert Entry
```json
{
  "timestamp": "2025-08-06T13:43:12.123456+0000",
  "event_type": "alert",
  "alert": {
    "signature": "ET POLICY External IP Lookup testmyids.com",
    "category": "Potential Corporate Privacy Violation",
    "severity": 2
  },
  "src_ip": "10.0.0.166",
  "dest_ip": "104.28.18.97"
}
```
## Test Method 2: Simulated Attack Response Signature
While browsing normally, Suricata picked up the following built-in detection rule:

```text
GPL ATTACK_RESPONSE id check returned root
```
This alert is triggered by common behavior associated with attack response signatures, likely tied to page requests or background service checks.

## Additional Observations
Suricata also detected background traffic such as:

```text
ET INFO Spotify P2P Client | 10.0.0.166 -> 10.0.0.255
```
This confirms that Suricata was successfully inspecting wireless interface traffic (`wlan0`) and identifying common P2P client behavior.

## Summary
Suricata was running in live mode on the wlan0 interface

Alerts were generated from a `ping` to `testmyids.com`

Additional detections appeared from Spotify and system behavior

`eve.json logs` were verified and parsed using the custom `alert_monitor.sh` script
