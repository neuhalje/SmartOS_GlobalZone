SmartOS Global Zone scripts
===========================

This repository contains script to automate the setup of [SmartOS Global Zones](http://wiki.smartos.org/display/DOC/Administering+the+Global+Zone).

`transfer_to_gz.sh` copies _features_ (subfolders) to `/opt/custom`.  E.g. `./transfer_to_gz.sh 192.168.114.130 ssh_authorized_keys snaptransfer/` copies the content of the folders `ssh_authorized_keys`, and `snaptransfer` to `/opt/custom` on `192.168.114.130`.

setup_ssh
--------------------

Copies all from [setup_ssh/setup_ssh/root.ssh](./setup_ssh/setup_ssh/root.ssh/authorized_keys)  into `~/root/.ssh` on every boot of the zone. [authorized_keys](./setup_ssh/setup_ssh/root.ssh/authorized_keys) is also copied into `/usbkey/config.inc`, this makes SmartOS use it.  This is achieved by running an SMF service (`svc:/ssh-key-import-atboot:default`) on each boot.

__please make sure, that the key in `authorized_keys` is your key, not my key!__

msmtp
-------
Provides a custom build of msmtp without SSL support, which would use OpenSSL, which in turn is not available in the GZ. Installed as `/opt/custom/msmtp/msmtp`.

snaptransfer
--------------

Periodically take ZFS snapshots, and send them to a backup host. Basically a mesh up of a [patched](https://github.com/graudeejs/zfSnap/pull/12) version of [zfSnap](https://github.com/graudeejs/zfSnap), [zxfer](https://code.google.com/p/zxfer/), and [snapxfer](http://zpool.org/2013/09/06/zfs-snapshots-and-remote-replication).

### Backup Configuration

The backup host, the source, and the target volume is configured in the [snapxfer](./snaptransfer/snapxfer) script.

### Crontab

[An SMF service](./snaptransfer/smf/snaptransfer.xml) installs a root `crontab` defined [here](./snaptransfer/snapxfer/crontab/snapxfer.crontab).


