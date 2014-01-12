#!/bin/sh

SSH_DIR=/opt/custom/setup_ssh/root.ssh
if [ -d $SSH_DIR ]
   then
  # ~/.ssh/authorized_keys is not used by SmartOS
   mkdir -p /root/.ssh && cp $SSH_DIR/* /root/.ssh/ && chmod 600 /root/.ssh/* && chmod 700 /root/.ssh

fi


grep -q root_authorized_keys_file /usbkey/config

if [ $? != 0 ]
then
  echo root_authorized_keys_file=authorized_keys>> /usbkey/config

  mkdir /usbkey/config.inc
  cp $SSH_DIR/authorized_keys /usbkey/config.inc/authorized_keys
fi

exit 0

