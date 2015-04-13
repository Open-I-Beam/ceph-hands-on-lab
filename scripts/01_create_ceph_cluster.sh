#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

# Creating new configuration
$CEPH_DEPLOY new $CLUSTERNAME-mon1

# Adding the 'public network' to the ceph.conf file
CEPH_CONF_PUBLIC_NETWORK="public_network = `ip addr show eth0 | grep "\<inet\>" | sed "s/^\s*\<inet\>\s*\([0-9]*\).\([0-9]*\).\([0-9]*\).*$/\1.\2.\3.0\/24/"`"
# For testing purpose, decreasing the grace period (default: 900 sec)
CEPH_CONF_GRACE="ceph_mon_osd_report_timeout=60"
if [ "$ECHO_ONLY" = true ]; then
    echo "Edit ceph.conf:"
    echo "----8<---------------------"
    echo $CEPH_CONF_PUBLIC_NETWORK
    echo $CEPH_CONF_GRACE
    echo "----8<---------------------"
else
    echo $CEPH_CONF_PUBLIC_NETWORK >> ceph.conf
    echo $CEPH_CONF_GRACE >> ceph.conf
fi

# Installing packages to the initial monitor and OSDs
$CEPH_DEPLOY install $CLUSTERNAME-mon1 $CLUSTERNAME-osd{1..3} $CLUSTERNAME-controller

# Deploying monitor
$CEPH_DEPLOY mon create $CLUSTERNAME-mon1

# Waiting for the monitor deploy finalization (key creation)
echo ""
echo "Waiting for monitor deploy finalization"
echo "SSH into $CLUSTERNAME-mon1 and watch /etc/ceph/ceph.client.admin.keyring"
echo "If it's there, Press [Enter]"
if [ "$ECHO_ONLY" = false ]; then read; fi

# Gathering keys
$CEPH_DEPLOY gatherkeys $CLUSTERNAME-mon1

$CEPH_DEPLOY admin $CLUSTERNAME-controller

# Deploying OSDs
$CEPH_DEPLOY osd create $CLUSTERNAME-osd1:/dev/vdb
$CEPH_DEPLOY osd create $CLUSTERNAME-osd2:/dev/vdb
$CEPH_DEPLOY osd create $CLUSTERNAME-osd3:/dev/vdb

# Creating default pools
$CEPH osd pool create images 256 256
$CEPH osd pool create volumes 256 256

# Information
echo
echo
echo You can check the CEPH Cluster status:
echo ceph status
echo ceph health
echo ceph osd tree
echo ceph df
echo ceph auth list
echo ceph "{mon | osd | pg | mds}" dump

