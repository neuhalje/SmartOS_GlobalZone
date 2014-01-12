#!/bin/sh

SSHD_SRC_DIR=/opt/custom/setup_ssh/sshd
SSHD_DST_DIR=/usbkey/ssh
if [ -d $SSHD_SRC_DIR ]
then
   cp $SSH_SRC_DIR/* $SSHD_DST_DIR/. && chmod 600 $SSHD_DST_DIR/* && chmod 700 $SSHD_DST_DIR
fi

exit 0

