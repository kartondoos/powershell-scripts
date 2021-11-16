Rem #static ip
netsh interface ipv4 set address name="Ethernet" source=static 192.168.1.20 255.255.255.0 192.168.1.1 #static ip  #ip/subnet/gateway
netsh interface ipv4 set dns name="Ethernet" source=static addr=8.8.8.8 #static first dns server
netsh interface ipv4 add dns name="Ethernet" 8.8.4.4 index=2 #static second dns server