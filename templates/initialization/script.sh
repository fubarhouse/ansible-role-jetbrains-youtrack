#!/bin/bash

### BEGIN INIT INFO
# Provides: youtrack
# Required-Start: $local_fs $remote_fs
# Required-Stop: $local_fs $remote_fs
# Default-Start: 2 3 4 5
# Default-Stop: S 0 1 6
# Short-Description: initscript for youtrack
# Description: initscript for youtrack
### END INIT INFO

export HOME=/home/youtrack
set -e

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
NAME=youtrack
SCRIPT=/usr/local/$NAME/$NAME.sh

d_start() {
    echo "Starting $NAME..."
    start-stop-daemon --start --background -x $SCRIPT start
    exit 0
}

d_restart() {
    echo "Restarting $NAME..."
    start-stop-daemon --start --background -x $SCRIPT stop
    start-stop-daemon --start --background -x $SCRIPT start
    exit 0
}

d_stop() {
    echo "Stopping $NAME..."
    start-stop-daemon --start --background -x $SCRIPT stop
    exit 0
}

d_version() {
    $SCRIPT version
    exit 0
}

d_status() {
    $SCRIPT status
    exit 0
}

case "$1" in
    "start")            d_start
                        ;;
    "stop")             d_stop
                        ;;
    "restart")          d_restart
                        ;;
    "force-reload")     d_restart
                        ;;
    "version")          d_version
                        ;;
    "status")           d_status
                        ;;
    *)                  echo "Usage: sudo /etc/init.d/youtrack {start|stop|restart}" >&2
                        exit 1
                        ;;
esac
exit 0