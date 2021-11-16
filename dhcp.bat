Rem #dhcp
netsh interface ip set dns name="Ethernet" source=dhcp #dns via dhcp
netsh interface ip set address name="Ethernet" source=dhcp #ip via dhcp