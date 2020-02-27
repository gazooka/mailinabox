#!/bin/bash

# general logs
sudo rm -f /var/log/*.log.[23456789].*
sudo rm -f /var/log/*.log.1[0123456789].*
sudo rm -f /var/log/*.log.2[0123456789].*
sudo rm -f /var/log/*.log.3[0123456789].*
sudo rm -f /var/log/apt/*.log.[23456789].*
sudo rm -f /var/log/apt/*.log.1[0123456789].*
sudo rm -f /var/log/apt/*.log.2[0123456789].*
sudo rm -f /var/log/apt/*.log.3[0123456789].*
sudo rm -f /var/log/audit/*.log.[23456789].*
sudo rm -f /var/log/audit/*.log.1[0123456789].*
sudo rm -f /var/log/audit/*.log.2[0123456789].*
sudo rm -f /var/log/audit/*.log.3[0123456789].*
sudo rm -f /var/log/dbconfig-common/*.log.[23456789].*
sudo rm -f /var/log/dbconfig-common/*.log.1[0123456789].*
sudo rm -f /var/log/dbconfig-common/*.log.2[0123456789].*
sudo rm -f /var/log/dbconfig-common/*.log.3[0123456789].*
sudo rm -f /var/log/dist-upgrade/*.log.[23456789].*
sudo rm -f /var/log/dist-upgrade/*.log.1[0123456789].*
sudo rm -f /var/log/dist-upgrade/*.log.2[0123456789].*
sudo rm -f /var/log/dist-upgrade/*.log.3[0123456789].*
sudo rm -f /var/log/landscape/*.log.[23456789].*
sudo rm -f /var/log/landscape/*.log.1[0123456789].*
sudo rm -f /var/log/landscape/*.log.2[0123456789].*
sudo rm -f /var/log/landscape/*.log.3[0123456789].*
sudo rm -f /var/log/letsencrypt/*.log.[23456789].*
sudo rm -f /var/log/letsencrypt/*.log.1[0123456789].*
sudo rm -f /var/log/letsencrypt/*.log.2[0123456789].*
sudo rm -f /var/log/letsencrypt/*.log.3[0123456789].*
sudo rm -f /var/log/lxd/*.log.[23456789].*
sudo rm -f /var/log/lxd/*.log.1[0123456789].*
sudo rm -f /var/log/lxd/*.log.2[0123456789].*
sudo rm -f /var/log/lxd/*.log.3[0123456789].*
sudo rm -f /var/log/munin/*.log.[23456789].*
sudo rm -f /var/log/munin/*.log.1[0123456789].*
sudo rm -f /var/log/munin/*.log.2[0123456789].*
sudo rm -f /var/log/munin/*.log.3[0123456789].*
sudo rm -f /var/log/nginx/*.log.[23456789].*
sudo rm -f /var/log/nginx/*.log.1[0123456789].*
sudo rm -f /var/log/nginx/*.log.2[0123456789].*
sudo rm -f /var/log/nginx/*.log.3[0123456789].*
sudo rm -f /var/log/ntpstats/*.log.[23456789].*
sudo rm -f /var/log/ntpstats/*.log.1[0123456789].*
sudo rm -f /var/log/ntpstats/*.log.2[0123456789].*
sudo rm -f /var/log/ntpstats/*.log.3[0123456789].*
sudo rm -f /var/log/roundcubemail/*.log.[23456789].*
sudo rm -f /var/log/roundcubemail/*.log.1[0123456789].*
sudo rm -f /var/log/roundcubemail/*.log.2[0123456789].*
sudo rm -f /var/log/roundcubemail/*.log.3[0123456789].*
sudo rm -f /var/log/samba/*.log.[23456789].*
sudo rm -f /var/log/samba/*.log.1[0123456789].*
sudo rm -f /var/log/samba/*.log.2[0123456789].*
sudo rm -f /var/log/samba/*.log.3[0123456789].*
sudo rm -f /var/log/unattended-upgrades/*.log.[23456789].*
sudo rm -f /var/log/unattended-upgrades/*.log.1[0123456789].*
sudo rm -f /var/log/unattended-upgrades/*.log.2[0123456789].*
sudo rm -f /var/log/unattended-upgrades/*.log.3[0123456789].*
sudo rm -f /var/log/z-push/*.log.[23456789].*
sudo rm -f /var/log/z-push/*.log.1[0123456789].*
sudo rm -f /var/log/z-push/*.log.2[0123456789].*
sudo rm -f /var/log/z-push/*.log.2[0123456789].*

# syslog - keep more of these
sudo rm -f /var/log/syslog.1[0123456789].*
sudo rm -f /var/log/syslog.2[0123456789].*
sudo rm -f /var/log/syslog.3[0123456789].*

# error logs
sudo rm -f /var/log/*.err.[23456789].*
sudo rm -f /var/log/*.err.1[0123456789].*
sudo rm -f /var/log/*.err.2[0123456789].*
sudo rm -f /var/log/*.err.3[0123456789].*

# minimise journal logs
sudo journalctl --vacuum-size=500M -q

# Azure
if sudo test -e "/var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/CommandExecution.log"; then
        sudo rm -f /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/CommandExecution.log.1
        sudo mv /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/CommandExecution.log /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/CommandExecution.log.1
fi
if sudo test -e "/var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/extension.log"; then
        sudo rm -f /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/extension.log.1
        sudo mv /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/extension.log /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/extension.log.1
fi
if sudo test -e "/var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/shell.log"; then
        sudo rm -f /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/shell.log.1
        sudo mv /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/shell.log /var/log/azure/Microsoft.Azure.RecoveryServices.VMSnapshotLinux/shell.log.1
fi

if sudo test -e "/var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/CommandExecution.log"; then
        sudo rm -f /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/CommandExecution.log.1
        sudo mv /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/CommandExecution.log /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/CommandExecution.log.1
fi
if sudo test -e "/var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/extension.log"; then
        sudo rm -f /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/extension.log.1
        sudo mv /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/extension.log /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/extension.log.1
fi
if sudo test -e "/var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/watcher.log"; then
        sudo rm -f /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/watcher.log.1
        sudo mv /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/watcher.log /var/log/azure/Microsoft.EnterpriseCloud.Monitoring.OmsAgentForLinux/watcher.log.1
fi
