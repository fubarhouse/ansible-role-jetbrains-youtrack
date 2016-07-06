#! /bin/bash

export HOME=/home/youtrack
export JAVA_HOME=/etc/alternatives/java

NAME=youtrack
PORT=8112
USR=/usr/local/$NAME
JAR=$USR/`ls -Lt $USR/*.jar | grep -o "$NAME-[Linux. YouTrack JAR as a Service. Alternative Method^/]*.jar" | head -1`
JARFILE=$(ls $USR | grep $NAME | grep .jar);
LOG=$USR/$NAME-$PORT.log
PID=$USR/$NAME-$PORT.pid

d_start() {
    if [[ -f $PID ]]; then
        PID_VALUE=`cat $PID`
        if [[ ! -z "$PID_VALUE" ]]; then
            PID_VALUE=`ps ax | grep $PID_VALUE | grep -v grep | awk '{print $1}'`
            if [[ ! -z "$PID_VALUE" ]]; then
                exit 1;
            fi
        fi
    fi

    PREV_DIR=`pwd`
    cd $USR
    exec nohup java -Xmx1g -XX:MaxPermSize=250M -Djava.awt.headless=true -jar $JAR/$JARFILE $PORT >> $LOG &> /dev/null
    echo $! > $PID
    cd $PREV_DIR
}

d_stop() {
    if [[ -f $PID ]]; then
        PID_VALUE=`cat $PID`
        if [[ ! -z "$PID_VALUE" ]]; then
            PID_VALUE=`ps ax | grep $PID_VALUE | grep -v grep | awk '{print $1}'`
            if [[ ! -z "$PID_VALUE" ]]; then
                kill $PID_VALUE
                WAIT_TIME=0
                while [[ -n `$(ps ax | grep $PID_VALUE | grep -v grep | wc -l -ne) 0 -a "$WAIT_TIME" -lt 2` ]]; do
                    sleep 1
                    WAIT_TIME=$(expr $WAIT_TIME + 1)
                done
                if [[ `$(ps ax | grep $PID_VALUE | grep -v grep | wc -l) -ne 0` ]]; then
                    WAIT_TIME=0
                    while [[ -n `$(ps ax | grep $PID_VALUE | grep -v grep | wc -l -ne) 0 -a "$WAIT_TIME" -lt 15` ]]; do
                        sleep 1
                        WAIT_TIME=$(expr $WAIT_TIME + 1)
                    done
                    echo
                fi
                if [[ -n `$(ps ax | grep $PID_VALUE | grep -v grep | wc -l -ne) 0` ]]; then
                    kill -9 $PID_VALUE
                fi
            fi
        fi
    rm -f $PID
    fi
}

d_version() {
    VERSION=$(ps ax | grep youtrack | grep .jar | cut -d '/' -f3-7 | cut -d ' ' -f1 | cut -d '-' -f2);
    echo "${VERSION/.jar/}";
}

d_status() {
    VERSION=$(ps ax | grep youtrack | grep .jar | cut -d '/' -f3-7 | cut -d ' ' -f1 | cut -d '-' -f2);
    if [[ -n "${VERSION}" ]] && [[ ! "${VERSION}" == "" ]]; then
        echo "Running";
    else
        echo "Not running";
    fi
}

case "$1" in
    start)      d_start
                ;;
    stop)       d_stop
                ;;
    version)    d_version
                ;;
    status)     d_status
                ;;
    *)          echo "Usage: $0 {start|stop|restart|version|status}" >&2
                exit 1
                ;;
esac
exit 0