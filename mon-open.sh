#/bin/sh
ifconfig wlan1 down
iwconfig wlan1 mode monitor
ifconfig wlan1 up
echo "monitor mode is open"
#