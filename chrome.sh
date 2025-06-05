#!/bin/bash

# Get the logged-in user
loggedInUser=$(/usr/bin/stat -f%Su /dev/console)

# Check if a user is logged in
if [ -z "$loggedInUser" ] || [ "$loggedInUser" = "root" ]; then
    echo "No user logged in, exiting." > /tmp/set_chrome_default.log
    exit 1
fi

# Log the user for debugging
echo "Running for user: $loggedInUser" >> /tmp/set_chrome_default.log

# Set Chrome as default for http and https protocols
su - "$loggedInUser" -c "defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{
    LSHandlerURLScheme = http;
    LSHandlerRoleAll = \"com.google.chrome\";
}'" >> /tmp/set_chrome_default.log 2>&1

su - "$loggedInUser" -c "defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{
    LSHandlerURLScheme = https;
    LSHandlerRoleAll = \"com.google.chrome\";
}'" >> /tmp/set_chrome_default.log 2>&1

# Rebuild LaunchServices database
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user >> /tmp/set_chrome_default.log 2>&1

# Restart Finder to apply changes
killall Finder >> /tmp/set_chrome_default.log 2>&1

echo "Script completed" >> /tmp/set_chrome_default.log
exit 0