# Wi-Fi Auto Login Script (PowerShell)

## Overview
This project automates the login process for Wi-Fi networks that use **captive portals** (webpages that require you to enter credentials before granting internet access).  

Instead of manually opening a browser and signing in each time, the script:

- Detects when you connect to the Wi-Fi network.  
- Parses the login page’s form fields.  
- Submits the required credentials via PowerShell.  
- Uses **Windows Task Scheduler** to run automatically when the specified network is detected or when there is no internet access with a captive portal (Event ID=4042).  

---

## Features
- Handles session cookies to maintain a valid login session..
- Uses **PowerShell** for HTTP requests and form parsing.
- Bypasses common SSL certificate errors and security pop-ups.
- Mimics browser headers (User-Agent, Referer) to avoid being blocked.
- Configurable for different networks (SSID and login URL).  
- Runs in the background via **Task Scheduler** once setup (no manual execution needed).  

---

## How It Works
1. PowerShell script checks for a network connection.  
2. It fetches the captive portal login page and parses the required form data.  
3. The script submits your credentials to authenticate automatically.  
4. A Windows Task Scheduler trigger runs the script when you connect to the Wi-Fi or when there is no internet access with a captive portal (Event ID=4042).  

---

## Setup Instructions
1. **Clone this repo**
   ```bash
   git clone https://github.com/ary4m4n03/Wifi-Auto-Login-Script.git
2. **Configure the script:**  
   - Open the autologinautomated.ps1 file and modify the variables in the CONFIG section at the top:
     - $loginPageUrl: Replace the placeholder with the full URL you are redirected to when you first connect to the WiFi.  
     - $username: Your username for the portal.   
     - $password: Your password.   
   - Use the Network section from the developer tools in the browser of your choice and check the Preserve Log box, then perform the login manually and check the js file execution at time of login.  
   - Click on the file to find the payload section of the login action. From here you can find the pageurl, Id and password as well as the referer and user-agent details (Optional).   
   - Paste these into the script at the specified places.

3. **Create a scheduled task:**  
   To automate the script to run at startup and whenever the specific Wi-Fi is connected, you can import WiFi_Auto_Login.xml in task scheduler.  
   Before doing so, make sure to replace:  
   - **ENTER_WIFI_NAME_HERE** with your WiFi's SSID.
   - **ENTER_SCRIPT_LOCATION_HERE** with the script's location.

---

## Disclaimer
Password needs to be stored in plain text inside .ps1 file. This method should only be used for low-security credentials, such as a public Hotel or University Wi-Fi network.   
Do not use this method for sensitive passwords.   
This script is for educational purposes only.   


