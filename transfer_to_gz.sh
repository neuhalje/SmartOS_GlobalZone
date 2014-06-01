#!/bin/bash

# Deploys the 'custom' directory to a SmartOS global zones /opt/. directory.

REMOTE=$1
if [ "x" == "x$REMOTE" -o "x$2" == "x" ]
then
  echo "Usage:"
  echo "     $0 GZ_IP FEATURE1 [FEATURE2] [..]"
  echo "e.g."
  echo "     $0 192.168.1.2 snaptransfer ssh_authorized_keys"
else
  # tar cvfz - -C custom  . | ssh root@${REMOTE}  "[ -d /opt/custom ] || mkdir /opt/custom; cd /opt/custom;gtar  xfvz -"
  #tar cvfz - -C ~/Documents/projects/SmartOS_GlobalZone/snaptransfer  .   -C ~/Documents/projects/SmartOS_GlobalZone/ssh_authorized_keys  . | ssh root@${REMOTE}  "[ -d /opt/custom ] || mkdir /opt/custom; cd /opt/custom;gtar  xfvz -"
  #tar cvfz - -C ~/Documents/projects/SmartOS_GlobalZone/snaptransfer  .   -C ~/Documents/projects/SmartOS_GlobalZone/ssh_authorized_keys  . | ssh root@${REMOTE}  "[ -d /opt/custom ] || mkdir /opt/custom; cd /opt/custom;gtar  xfvz -"
  shift
  TAR_INCLUDES=""
  FEATURE_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  for FEATURE in "$@"
  do
   TAR_INCLUDES="${TAR_INCLUDES} -C $FEATURE_ROOT/$FEATURE . "
  done
  tar cvfz - ${TAR_INCLUDES} | ssh root@${REMOTE}  "[ -d /opt/custom ] || mkdir /opt/custom; cd /opt/custom;gtar  xfvz -"

  for FEATURE in "$@"
  do
   if [ -f $FEATURE_ROOT/$FEATURE/runonce.sh ]
   then
      cat $FEATURE_ROOT/$FEATURE/runonce.sh | tee | ssh -t root@${REMOTE}
   fi
  done
fi

