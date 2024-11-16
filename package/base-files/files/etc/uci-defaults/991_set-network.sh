#!/bin/sh

uci set dhcp.wan.ignore='1'
uci set dhcp.wan6.ignore='1'

uci set dhcp.lan.force '1'
uci set dhcp.lan.ra='hybrid'
uci set dhcp.lan.ra_default '1'
uci set dhcp.lan.ra_slaac='1'

uci del_list dhcp.lan.ra_flags='other-config'
uci add_list dhcp.lan.ra_flags='none'

uci commit dhcp
/etc/init.d/odhcpd restart

uci set network.lan.ip6assign='64'
uci set network.lan.ip6ifaceid='eui64'

uci commit network
/etc/init.d/network restart
