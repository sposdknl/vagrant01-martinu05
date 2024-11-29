#!/usr/bin/env bash

# Unikátní hostname pro Debian (lepší než hostname školní stanice)
UNIQUE_HOSTNAME="debian-martinů"
SHORT_HOSTNAME=$(echo $UNIQUE_HOSTNAME | cut -d'-' -f1,2)

# Záloha původního zabbix_agent2.conf
sudo cp -v /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf-orig

# Konfigurace zabbix_agent2.conf
sudo sed -i "s/Hostname=Zabbix server/Hostname=$SHORT_HOSTNAME/g" /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/Server=127.0.0.1/Server=enceladus.pfsense.cz/g' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/ServerActive=127.0.0.1/ServerActive=enceladus.pfsense.cz/g' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/# Timeout=3/Timeout=30/g' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/# HostMetadata=/HostMetadata=SPOS/g' /etc/zabbix/zabbix_agent2.conf

# Zobrazí rozdíly mezi originální a upravenou konfigurací
sudo diff -u /etc/zabbix/zabbix_agent2.conf-orig /etc/zabbix/zabbix_agent2.conf

# Restart služby zabbix-agent2
sudo systemctl restart zabbix-agent2

# Kontrola stavu služby
sudo systemctl status zabbix-agent2 --no-pager

# EOF
