#!/bin/sh

TMPFILE=/tmp/crontab.tmp.$$
echo > $TMPFILE

cd /opt/custom/crontab/
for ct in /opt/custom/crontab/*.crontab
do
  cat $ct >> $TMPFILE  2>/dev/null
done

/usr/bin/crontab $TMPFILE
