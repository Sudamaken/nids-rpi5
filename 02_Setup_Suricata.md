# 02 – Setup Suricata

This section covers how I installed and configured Suricata on my Raspberry Pi 5 running Kali Linux. This step was part of Phase 2 in my NIDS project, following basic system updates and package installations.

## Installing Suricata

### 1. Update and upgrade the system

```bash
sudo apt update && sudo apt upgrade -y
```
### 2. Install Suricata

```bash
sudo apt install suricata -y
```

### 3. Verify the installation

```bash
suricata --build-info
```
This displays build options and confirms the binary is installed correctly.

## Network Interface Configuration
To monitor wireless traffic using Suricata, I needed to identify the wireless interface name:

```bash
ip a
```
On my system, the wireless interface was named `wlan0`.

## Configuration Changes
I edited the Suricata configuration file to point to the correct interface:

```bash
sudo nano /etc/suricata/suricata.yaml
```
In the YAML file, I found the `af-packet` section and changed the interface value:

```yaml
Copy
Edit
af-packet:
  - interface: wlan0
```
## Test Configuration
Before launching Suricata, I validated the config file:

```bash
sudo suricata -T -c /etc/suricata/suricata.yaml -v
```
A successful test shows:

```lua
Configuration provided was successfully loaded.
```
## Running Suricata in Live Mode
Once confirmed, I started Suricata using the wireless interface:

```bash
sudo suricata -i wlan0 -c /etc/suricata/suricata.yaml -D
```
`-i wlan0`: specifies the interface to monitor

`-c`: points to the config file

`-D`: runs Suricata in the background (daemon mode)

## Verifying Logs
After launching Suricata, I verified it was logging alerts properly by checking the default log directory:

```bash
cd /var/log/suricata/
ls
```
The `eve.json` file in this directory contains the alerts. I created a symlink for quick access:

```bash
ln -s /var/log/suricata/eve.json ~/Projects/NIDS-RaspberryPi/logs/eve.json
```
This allowed me to monitor alerts directly from my project folder.
