# Wi-Fi Auto Login Script (PowerShell)

## Overview
This project automates the login process for Wi-Fi networks that use **captive portals** (webpages that require you to enter credentials before granting internet access).  

Instead of manually opening a browser and signing in each time, the script:

- Detects when you connect to the Wi-Fi network.  
- Parses the login page’s form fields.  
- Submits the required credentials via PowerShell.  
- Uses **Windows Task Scheduler** to run automatically when the network is detected.  

---

## Features
- **Automatic login** to Wi-Fi captive portals.
- Uses **PowerShell** for HTTP requests and form parsing.  
- Configurable for different networks (SSID and login URL).  
- Runs in the background via **Task Scheduler** once setup (no manual execution needed).  

---

## How It Works
1. PowerShell script checks for a network connection.  
2. It fetches the captive portal login page and parses the required form data.  
3. The script submits your credentials to authenticate automatically.  
4. A Windows Task Scheduler trigger runs the script when you connect to the Wi-Fi.  

---

## Setup Instructions
1. **Clone this repo**
   ```bash
   git clone https://github.com/ary4m4n03/Wifi-Auto-Login-Script.git
Edit the script

Add your Wi-Fi SSID.

Update the captive portal login URL and form field names.

Insert your credentials (or configure a secure credential store).

Create a scheduled task

Use the included XML task definition (or set up manually in Task Scheduler).

Trigger: When connecting to your chosen Wi-Fi.

## Disclaimer
This script is for educational purposes only.
Use only on networks you are authorized to access. The author is not responsible for misuse or any violations of terms of service.


