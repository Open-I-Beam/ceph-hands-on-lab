ECHO_ONLY=true

# Getting the hostname
HOSTNAME=`hostname`

# Cutting the postfix of hostname
CLUSTERNAME=${HOSTNAME%-*}

if [ "$ECHO_ONLY" = true ]; then
    ECHO="echo "
fi
CEPH_DEPLOY="${ECHO}ceph-deploy"
CEPH="${ECHO}ceph"
