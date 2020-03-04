# README #

Scripts, etc. for running your own https://mailinabox.email/

## Scripts

* `cron.sh` - daily cron script that backs up mail-in-a-box, frees memory and auto-removes / updates / upgrades packages; schedule via `crontab -e` using `0 0 * * * /home/<user>/cron.sh`
* `mail-in-a-box-backup.sh` - backs up mail-in-a-box; automatically calls `mail-in-a-box-copy-backups-to-azure.sh`; can be passed a parameter to schedule full backups eg via `crontab -e` using `0 4 1 * * /home/<user>/mail-in-a-box-backup.sh --full`
* `mail-in-a-box-copy-backups-to-azure.sh` - copies the backup files to Azure if azcopy is present in the directory
* `mail-in-a-box-update.sh` - installs / updates mail-in-a-box
* `packages-auto-remove.sh` - auto-removes packages
* `packages-update.sh` - updates packages
* `packages-upgrade.sh` - upgrades packages
* `system-install-azcopy.sh` - installs azcopy in the current directory
* `system-install-dependency-agent.sh` - installs / updates Microsoft Dependency agent
* `system-logs-cleanup.sh` - cleans up log files; schedule via `crontab -e` using `0 4 1 * * /home/<user>/system-logs-cleanup.sh`
* `system-memory-free.sh` - frees memory
* `system-reboot-if-required.sh` - reboots the machine, but only if a reboot is required
* `system-reboot.sh` - reboots the machine

### Copy backups to Azure scripts

* Change `"URL"` to the URL to copy them to, i.e. a storage account with a shared access key in the URL
* If `azcopy` doesn't exist in the same directory, it will do nothing

### Packages management scripts

* Change `info@example.com` to the email address you want to receive failure notifications at
* If the script fails, it reboots the machine which will hopefully allow it to complete next time
* If it fails a second time, it runs `dpkg --configure -a` and then reboots
* If it fails a third time it sends a notification email
* If the script succeeds and a reboot is required, it reboots the machine
