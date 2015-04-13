#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

# Creating $CEPH buckets
$CEPH osd crush add-bucket ssd-bucket root

# Allowing replicas to be created on different OSDs but possibly on the same host,
# we need to create a new ruleset
$CEPH osd crush rule create-simple ssd-ruleset ssd-bucket host firstn

# Creating logical host buckets
$CEPH osd crush add-bucket $CLUSTERNAME-osd1-ssd host
$CEPH osd crush add-bucket $CLUSTERNAME-osd2-ssd host
$CEPH osd crush add-bucket $CLUSTERNAME-osd3-ssd host
$CEPH osd crush add-bucket $CLUSTERNAME-osd4-ssd host
$CEPH osd crush move $CLUSTERNAME-osd1-ssd root=ssd-bucket
$CEPH osd crush move $CLUSTERNAME-osd2-ssd root=ssd-bucket
$CEPH osd crush move $CLUSTERNAME-osd3-ssd root=ssd-bucket
$CEPH osd crush move $CLUSTERNAME-osd4-ssd root=ssd-bucket


$CEPH_DEPLOY osd create $CLUSTERNAME-osd1:/dev/vdc
$CEPH_DEPLOY osd create $CLUSTERNAME-osd2:/dev/vdc
$CEPH_DEPLOY osd create $CLUSTERNAME-osd3:/dev/vdc
$CEPH_DEPLOY osd create $CLUSTERNAME-osd4:/dev/vdc

$CEPH osd crush set 4 0.01 root=ssd-bucket host=$CLUSTERNAME-osd1-ssd
$CEPH osd crush set 5 0.01 root=ssd-bucket host=$CLUSTERNAME-osd2-ssd
$CEPH osd crush set 6 0.01 root=ssd-bucket host=$CLUSTERNAME-osd3-ssd
$CEPH osd crush set 7 0.01 root=ssd-bucket host=$CLUSTERNAME-osd4-ssd

# Creating $CEPH pools
$CEPH osd pool create volumes-cache 256 256 replicated ssd-ruleset
$CEPH osd tier add volumes volumes-cache
$CEPH osd tier cache-mode volumes-cache writeback
$CEPH osd tier set-overlay volumes volumes-cache
$CEPH osd pool set volumes-cache hit_set_type bloom
$CEPH osd pool set volumes-cache hit_set_count 1
$CEPH osd pool set volumes-cache hit_set_period 3600
$CEPH osd pool set volumes-cache target_max_bytes 1000000000000

# Information
echo
echo
echo You can check the ceph Cluster status:
echo ceph status
echo ceph health
echo ceph osd tree
echo ceph df
echo ceph auth list
echo ceph "{mon | osd | pg | mds}" dump

