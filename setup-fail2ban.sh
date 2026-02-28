#!/bin/bash
#By Anggarda Saputra Wijaya
#Install Fail2ban for Proxmox
apt update && apt install fail2ban -y
cp proxmox.conf /etc/fail2ban/filter.d/proxmox.conf
cp jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
systemctl status fail2ban
systemctl is-enabled fail2ban
fail2ban-client status sshd
fail2ban-client status proxmox
