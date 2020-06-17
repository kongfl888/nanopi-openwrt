#!/bin/sh
# [K] (C)2020
# http://github.com/kongfl888

get_ipv4_address() {
  if ! if_status=$(ifstatus $1); then
    return 1
  fi
  echo $if_status | jsonfilter -e "@['ipv4-address'][0]['address']"
}

get_eth_up() {
  if ! if_status=$(ifstatus $1); then
    return 1
  fi
  #true or false
  echo $if_status | jsonfilter -e "@['up']"
}

logger 'Check Network: Script started!'
echo 'Check Network: Script started!' > /tmp/check_network.log

lgetipfail=0
wgetipfail=0
landown=0
wandown=0

while :; do
    sleep 30

    if ! lan_addr1=$(get_ipv4_address lan); then
        lgetipfail=1
    fi

    if ! wan_addr1=$(get_ipv4_address wan); then
        wgetipfail=1
    fi

    if ! lanup=$(get_eth_up lan); then
        landown=1
    fi

    if ! wanup=$(get_eth_up wan); then
        wandown=1
    fi

    if [ $lgetipfail -ne 0 -a $wgetipfail -ne 0 ]; then
        logger "[Check Network] eth0/1 lost. network restarting"
        echo "[Check Network] eth0/1 lost. network restarting" >> /tmp/check_network.log
        /etc/init.d/network restart >/dev/null 2>&1
        sleep 90
        /etc/init.d/firewall reload >/dev/null 2>&1
    elif [ $landown -ne 0 -a $wandown -ne 0 ]; then
        logger "[Check Network] eth0/1 is down. network restarting"
        echo "[Check Network] eth0/1 is down. network restarting" >> /tmp/check_network.log
        /etc/init.d/network restart >/dev/null 2>&1
        sleep 90
        /etc/init.d/firewall reload >/dev/null 2>&1
    else
        echo "1st while break." >> /tmp/check_network.log
        logger "Check Network: 1st check is ok. Running 2nd check."
        break
    fi
    sleep 30
done

fail_countl=0
fail_countw=0

while :; do
    sleep 30s

    lan_addr=$(get_ipv4_address lan)
    wan_addr=$(get_ipv4_address wan)
    # try to connect
    if ping -W 1 -c 1 "$lan_addr" >/dev/null 2>&1; then
        # No problem!
        if [ $fail_countl -gt 0 ]; then
            logger 'Check Network: LAN problems solved!'
            echo 'Check Network: LAN problems solved!' >> /tmp/check_network.log
        fi
        fail_countl=0
    else
        fail_countl=$((fail_countl + 1))
    fi
    if ping -W 1 -c 1 "$wan_addr" >/dev/null 2>&1; then
        # No problem!
        if [ $fail_countw -gt 0 ]; then
            logger 'Check Network: WAN problems solved!'
            echo 'Check Network: WAN problems solved!' >> /tmp/check_network.log
        fi
        fail_countw=0
    else
        fail_countw=$((fail_countw + 1))
    fi
    
    if [ $fail_countl -eq 0 -a $fail_countw -eq 0 ]; then
        continue
    fi
  
    # May have some problem
    logger "Check Network: Network may have some problems!"
    echo "Check Network: Network may have some problems!" >> /tmp/check_network.log

    fail_count=$(($fail_countl+$fail_countw))
  
    if [ $fail_count -ge 6 ]; then
        # try again!        
        lan_addr=$(get_ipv4_address lan)
        wan_addr=$(get_ipv4_address wan)

        mokl=0
        mokw=0
        if ping -W 1 -c 1 "$lan_addr" >/dev/null 2>&1; then
            mokl=1
        fi
        if ping -W 1 -c 1 "$wan_addr" >/dev/null 2>&1; then
            mokw=1
        fi
        if [ $mokl -eq 1 -a $mokw -eq 1 ]; then
            continue
        fi

        echo 'Check Network: Network problem! Firewall reloading...' >> /tmp/check_network.log
        logger 'Check Network: Network problem! Firewall reloading...'
        /etc/init.d/firewall reload >/dev/null 2>&1
        sleep 20

        mokl=0
        mokw=0
        if ping -W 1 -c 1 "$lan_addr" >/dev/null 2>&1; then
            mokl=1
        fi
        if ping -W 1 -c 1 "$wan_addr" >/dev/null 2>&1; then
            mokw=1
        fi
        if [ $mokl -eq 1 -a $mokw -eq 1 ]; then
            continue
        fi

        echo 'Check Network: Network problem! Network reloading...' >> /tmp/check_network.log
        logger 'Check Network: Network problem! Network reloading...'
        /etc/init.d/network restart >/dev/null 2>&1
        sleep 80
    fi
done
