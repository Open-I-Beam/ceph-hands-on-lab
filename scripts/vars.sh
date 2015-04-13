if [ "$1" = "--run" ]; then
    ECHO_ONLY=false
else
    ECHO_ONLY=true
fi

# Getting the hostname
HOSTNAME=`hostname`

# Cutting the postfix of hostname
CLUSTERNAME=${HOSTNAME%-*}

if [ "$ECHO_ONLY" = true ]; then
    ECHO="echo "
fi
CEPH_DEPLOY="${ECHO}ceph-deploy"
CEPH="${ECHO}ceph"
