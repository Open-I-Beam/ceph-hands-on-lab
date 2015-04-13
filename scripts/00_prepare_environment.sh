#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

echo "Host *" > ~/.ssh/config
echo "    StrictHostKeyChecking no" >> ~/.ssh/config
echo "    UserKnownHostsFile=/dev/null" >> ~/.ssh/config

for i in mon{1,2,3} osd{1,2,3,4} controller; do
    ssh $CLUSTERNAME-$i sudo apt-get -y install ntp
    ssh $CLUSTERNAME-$i sudo service ntp stop
    ssh $CLUSTERNAME-$i sudo ntpdate pool.ntp.org
    ssh $CLUSTERNAME-$i sudo service ntp start
done

for i in mon{1,2,3}; do
    ssh $CLUSTERNAME-$i sudo service ceph-mon-all restart
done
