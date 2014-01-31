snapxfer
==========

Periodically snapshots the source ZPOOL, and sends it to the destination pool (which can be on another host).

Mesh up of (more or less modified versions) of [zfSnap](https://github.com/graudeejs/zfSnap), [snapxfer](http://zpool.org/2013/09/06/zfs-snapshots-and-remote-replication), and [zxfer](https://code.google.com/p/zxfer/) (augemented to use [mbuffer](http://www.maier-komor.de/mbuffer.html)).

Usage
------

Install in `/opt/custom`. Configure [snapxfer](snapxfer/snapxfer) and adjust `DATASETS`, `DEST_DATASET`, and `DHOST`. Make the hosts root account `ssh`into the `DHOST`s root account via pubkey.

Run snapxfer every few minutes with `/opt/custom/snapxfer/snapxfer async` to replicate a short lived (1h) snapshot to `DEST_DATASET` on `DHOST`.

Run `snapxfer  hourly|daily|weekly|monthly` to create longer lived snapshots (which are then copied over by `snapxfer async`).

`snapxfer daily` purges expired snapshots as well. `snapxfer purge` will purge them without taking additional snaphsots.

### crontab

A crontab is located in [/opt/custom/snapxfer/crontab/snapxfer.crontab](./snapxfer/crontab/snapxfer.crontab).

### SmartOS Global Zone

Import the [smf](./smf) service to update the crontab on boot.
