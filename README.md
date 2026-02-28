## Overview

<p align="center">
<img src="img/banner.png">
</p>

### Information

Fail2Ban is an open-source intrusion prevention framework that protects Linux servers from brute-force attacks by monitoring log files (e.g., SSH, Apache) for malicious activity. It automatically updates firewall rules (iptables/nftables) to ban IP addresses that exhibit suspicious behavior, such as too many failed login attempts

### Tested Version

* Proxmox Virtualizaztion Environment 8.3

### Issue Bruteforce

* Bruteforce SSH (Port 22)
* Bruteforce Login Pages (HTTP, HTTPS, Port 8006)

## Installing
```
root@pve:~# git clone https://github.com/anggrdwjy/proxmox-fail2ban.git
Cloning into 'proxmox-fail2ban'...
remote: Enumerating objects: 43, done.
remote: Counting objects: 100% (43/43), done.
remote: Compressing objects: 100% (40/40), done.
remote: Total 43 (delta 7), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (43/43), 503.65 KiB | 1.36 MiB/s, done.
Resolving deltas: 100% (7/7), done.
root@pve:~# cd proxmox-fail2ban
root@pve:~/proxmox-fail2ban# chmod -R 777 *
root@pve:~/proxmox-fail2ban# ls -l
total 20
drwxrwxrwx 2 root root 4096 Feb 28 16:45 img
-rwxrwxrwx 1 root root  223 Feb 28 16:45 jail.local
-rwxrwxrwx 1 root root  108 Feb 28 16:45 proxmox.conf
-rwxrwxrwx 1 root root 1894 Feb 28 16:45 README.md
-rwxrwxrwx 1 root root  341 Feb 28 16:45 setup-fail2ban.sh
root@pve:~/proxmox-fail2ban# 
```

## Running
```
root@pve:~/proxmox-fail2ban# ./setup-fail2ban.sh 
Get:1 http://security.debian.org bookworm-security InRelease [48.0 kB]
Hit:2 http://ftp.debian.org/debian bookworm InRelease                                        
Get:3 http://ftp.debian.org/debian bookworm-updates InRelease [55.4 kB]
Hit:4 http://download.proxmox.com/debian/ceph-quincy bookworm InRelease
Hit:5 http://download.proxmox.com/debian/pve bookworm InRelease
Fetched 103 kB in 2s (64.0 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
230 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  python3-pyinotify whois
Suggested packages:
  system-log-daemon monit python-pyinotify-doc
The following NEW packages will be installed:
  fail2ban python3-pyinotify whois
0 upgraded, 3 newly installed, 0 to remove and 230 not upgraded.
Need to get 549 kB of archives.
```

## Verification

Status Fail2ban
```
systemctl status fail2ban
```

Log Monitoring Fail2ban
```
tail -f /var/log/fail2ban.log
```

## Testing
```
```

## Unban IP 

Unban status SSH
```
root@pve:~# fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     5
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 1
   |- Total banned:     1
   `- Banned IP list:   10.13.3.55
root@pve:~# 
```

Unban IP for SSH
```
fail2ban-client set sshd unbanip 10.13.3.55
```

Unban status Proxmox
```
root@pve:~# fail2ban-client status proxmox
Status for the jail: proxmox
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     6
|  `- Journal matches:
`- Actions
   |- Currently banned: 1
   |- Total banned:     2
   `- Banned IP list:   10.13.3.55
root@pve:~# 
```

Unban IP for HTTP, HTTPS
```
fail2ban-client set proxmox unbanip 10.13.3.55
```

## Support

* [:octocat: Follow me on GitHub](https://github.com/anggrdwjy)
* [🔔 Subscribe me on Youtube](https://www.youtube.com/@anggarda.wijaya)
  
### Bug

Please open an issue on GitHub with as much information as possible if you found a bug.
* Your Proxmox and Fail2ban Version
* All the logs and message outputted
* etc
