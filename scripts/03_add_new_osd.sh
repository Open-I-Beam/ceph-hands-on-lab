#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

# Installing packages to the new osd
$CEPH_DEPLOY install $CLUSTERNAME-osd4

# Deploying OSD
$CEPH_DEPLOY osd create $CLUSTERNAME-osd4:/dev/vdb

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

