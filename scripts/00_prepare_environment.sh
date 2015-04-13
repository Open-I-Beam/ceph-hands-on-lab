#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

echo "Host *" > ~/.ssh/config
echo "    StrictHostKeyChecking no" > ~/.ssh/config
echo "    UserKnownHostsFile=/dev/null" > ~/.ssh/config

ssh $CLUSTERNAME-mon1 apt-get -y install ntp
ssh $CLUSTERNAME-mon2 apt-get -y install ntp
ssh $CLUSTERNAME-mon3 apt-get -y install ntp
ssh $CLUSTERNAME-osd1 apt-get -y install ntp
ssh $CLUSTERNAME-osd2 apt-get -y install ntp
ssh $CLUSTERNAME-osd3 apt-get -y install ntp
ssh $CLUSTERNAME-osd4 apt-get -y install ntp
