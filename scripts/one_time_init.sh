#!/bin/sh
# [K] (C)2020
# built
# mv ../../scripts/one_time_init.sh package/base-files/files/usr/bin && sed -i '/exit/i\/bin/sh /usr/bin/one_time_init.sh &' package/base-files/files/etc/rc.local
# https://github.com/kongfl888/nanopi-openwrt

sleep 15s

DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: Init starting." > /tmp/one_time_init.log

# del from rc.local
sed -i '/one_time_init.sh/d' /etc/rc.local >/dev/null 2>&1
sleep 3s
sed -i '/one_time_init.sh/d' /etc/rc.local >/dev/null 2>&1

DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: set arch." >> /tmp/one_time_init.log
sed -i '/<%:Architecture%>/d' /usr/lib/lua/luci/view/admin_status/index.htm >/dev/null 2>&1
sed -i '/<%:CPU Info%><\/td>/i\\t\t<tr><td width="33%"><%:Architecture%></td><td>ARMv8 / Cortex-A53,64-bit (Rockchip rk3328)</td></tr>' /usr/lib/lua/luci/view/admin_status/index.htm

#disable some boot items
DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: disable some boot items" >> /tmp/one_time_init.log
sleep 1s

if [ -e "/etc/init.d/iptvhelper" ]; then
    /etc/init.d/iptvhelper stop
    /etc/init.d/iptvhelper disable
fi

if [ -e "/etc/init.d/mwan3" ]; then
    /etc/init.d/mwan3helper stop
    /etc/init.d/mwan3 stop
    /etc/init.d/mwan3 disable
    /etc/init.d/mwan3helper disable
fi

# fix autorewan
if [ -e "/etc/init.d/autorewan" ]; then
    DATE=`date +[%Y-%m-%d]%H:%M:%S`
    echo $DATE" One time init Script: fix autorewan" >> /tmp/one_time_init.log
    /etc/init.d/autorewan enable
    chmod +x /etc/init.d/autorewan
    [ -e "/usr/bin/dorewan" ] && chmod +x /usr/bin/dorewan
    /etc/init.d/autorewan restart >/dev/null 2>&1
fi

sleep 2s

# remove ddns
if [ "${1}" = "1" ]; then
    #lite2
    DATE=`date +[%Y-%m-%d]%H:%M:%S`
    echo $DATE" One time init Script: remove ddns" >> /tmp/one_time_init.log
    opkg remove *ddns* >/dev/null 2>&1
fi

sleep 2

# set ipaddr
DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: set ipaddr" >> /tmp/one_time_init.log
uci set network.lan.ipaddr=192.168.31.3
uci commit network

sleep 3
# restart network
DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: network restarting." >> /tmp/one_time_init.log
/etc/init.d/network restart >/dev/null 2>&1

sleep 5
DATE=`date +[%Y-%m-%d]%H:%M:%S`
echo $DATE" One time init Script: -- Init finish --" >> /tmp/one_time_init.log
if [ -e "/usr/bin/one_time_init.sh" ]; then
    rm -f /usr/bin/one_time_init.sh
fi

exit 0
