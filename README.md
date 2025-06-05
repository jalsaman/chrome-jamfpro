# chrome-jamfpro

Chrome Default Browser Setter (macOS)
A Bash script to automatically set Google Chrome as the default browser for HTTP/HTTPS protocols on macOS.

Features

Detects the currently logged-in user (skips if root or no user)
Modifies macOS LaunchServices preferences to set Chrome as default handler
Handles both HTTP and HTTPS protocols
Rebuilds the LaunchServices database for immediate effect
Restarts Finder to apply changes
Includes logging to /tmp/set_chrome_default.log for debugging


Usage

Make the script executable:
bash
chmod +x chrome.sh
Run as root (or with sudo):
bash
sudo ./chrome.sh
Notes

Requires Google Chrome to be installed
Works on macOS systems with Bash
Modifies system preferences - use with caution
Logs all operations to /tmp/set_chrome_default.log
Why?

Useful for enterprise deployments, MDM solutions, or automated workstation setups where Chrome needs to be set as the default browser.

Tried and tested it on Jamf Pro 

# PLEASE NOTE THE MACHINE NEEDS A REBOOT FOR THE CHROME BROWSER TO BE SET AS DEFAULT ONCE THE SCIPT IS EXECUTED MANUALLY ON A DEVICE OR EVEN VIA JAMF PRO 
