#!/usr/bin/env bash

# Instalace nezbytných balíčků
sudo apt-get update -y
sudo apt-get install -y wget gnupg2 net-tools

# Přidání Zabbix repozitáře
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_latest+debian11_all.deb
sudo dpkg -i zabbix-release_latest+debian11_all.deb

# Aktualizace repository
sudo apt-get update -y

# Instalace Zabbix Agent2 a jeho pluginů
sudo apt-get install -y zabbix-agent2 zabbix-agent2-plugin-*

# Povolení služby Zabbix Agent2
sudo systemctl enable zabbix-agent2

# Spuštění a restart služby Zabbix Agent2
sudo systemctl restart zabbix-agent2

# Kontrola stavu služby Zabbix Agent2
sudo systemctl status zabbix-agent2 --no-pager

# EOF
