#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

# Installing packages to the new monitors
#$CEPH_DEPLOY install $CLUSTERNAME-mon2 $CLUSTERNAME-mon3

# Deploying monitors
$CEPH_DEPLOY mon create $CLUSTERNAME-mon2 $CLUSTERNAME-mon3

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

