# README #

Scripts, etc. for running your own mailinabox.

## Scripts

* cron - daily cron script that frees memory and updates packages; schedule via `crontab -e` using `0 2 * * * /home/<user>/cron.sh`
* free-memory - frees memory
* reboot - reboots the machine
* update-mail-in-a-box - updates mailinabox
* update-packages - updates packages

### Update packages scripts

* Change `info@example.com` to the email address you want to receive failure notifications at
* If the update fails, it reboots the machine which will hopefully allow it to complete next time
* If it fails a second time, it runs `dpkg --configure -a` and then reboots
* If it fails a third time it sends a notification email
* If the update succeeds and a reboot is required, it reboots the machine
