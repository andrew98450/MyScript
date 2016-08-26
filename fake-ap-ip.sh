#/bin/sh
ifconfig at0 10.0.0.1/24 up
route add -net 10.0.0.0 netmask 255.255.255.0 gw 10.0.0.1
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -F
iptables -P FORWARD ACCEPT
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i at0 --destination-port 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp -i at0 --destination-port 443 -j REDIRECT --to-port 8080
dnsmasq -C /etc/dnsmasq.conf -d  
#