#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

# Creating new configuration
$CEPH_DEPLOY purge $CLUSTERNAME-mon{1..3} $CLUSTERNAME-osd{1..4} $CLUSTERNAME-controller
$CEPH_DEPLOY purgedata $CLUSTERNAME-mon{1..3} $CLUSTERNAME-osd{1..4} $CLUSTERNAME-controller
$CEPH_DEPLOY forgetkeys

for h in $CLUSTERNAME-osd{1..4}; do
    echo "Zapping osd $h"
    $ECHO ssh $h sudo dd if=/dev/zero of=/dev/vdb bs=1M count=64
    $ECHO ssh $h sudo dd if=/dev/zero of=/dev/vdc bs=1M count=64
    $ECHO ssh $h sudo parted -s /dev/vdb mklabel gpt
    $ECHO ssh $h sudo parted -s /dev/vdc mklabel gpt
done

for h in $CLUSTERNAME-osd{1..4} $CLUSTERNAME-mon{1..3}; do
    $ECHO ssh $h sudo apt-get autoremove -y --purge librbd1
    $ECHO ssh $h sudo rm -rf /var/lib/ceph /etc/ceph
done

$ECHO sudo apt-get autoremove -y --purge librbd1
$ECHO rm -rf ~/.cephdeploy.conf

echo ""
echo "You should also remove all remaining files in working directory. rm *"
echo ""
