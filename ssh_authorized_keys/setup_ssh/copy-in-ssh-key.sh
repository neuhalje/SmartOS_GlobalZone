#!/bin/sh

SSH_DIR=/opt/custom/setup_ssh/root.ssh
if [ -d $SSH_DIR ]
   then
   mkdir -p /root/.ssh && cp $SSH_DIR/* /root/.ssh/ && chmod 600 /root/.ssh/* && chmod 700 /root/.ssh

fi

exit 0

