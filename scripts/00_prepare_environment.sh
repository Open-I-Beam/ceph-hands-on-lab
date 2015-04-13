#!/bin/bash
source `dirname ${BASH_SOURCE[0]}`/vars.sh $@

echo "Host *" > ~/.ssh/config
echo "    StrictHostKeyChecking no" > ~/.ssh/config
echo "    UserKnownHostsFile=/dev/null" > ~/.ssh/config

ssh $CLUSTERNAME-mon01 apt-get -y install ntp
ssh $CLUSTERNAME-mon02 apt-get -y install ntp
ssh $CLUSTERNAME-mon03 apt-get -y install ntp
ssh $CLUSTERNAME-osd01 apt-get -y install ntp
ssh $CLUSTERNAME-osd02 apt-get -y install ntp
ssh $CLUSTERNAME-osd03 apt-get -y install ntp
ssh $CLUSTERNAME-osd04 apt-get -y install ntp
