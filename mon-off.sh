#/bin/sh
ifconfig wlan1 down
iwconfig wlan1 mode managed
ifconfig wlan1 up
echo "monitor mode is off"
#