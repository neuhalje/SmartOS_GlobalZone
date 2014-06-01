#!/usr/bin/bash

/usr/sbin/svccfg -s network/ipfilter:default setprop firewall_config_default/policy = astring: custom
/usr/sbin/svccfg -s network/ipfilter:default setprop firewall_config_default/custom_policy_file = astring: "/opt/custom/ipfilter/ipf.conf"

/usr/sbin/svcadm enable ipfilter
/usr/sbin/svcadm refresh ipfilter
/usr/sbin/svcadm restart ipfilter
