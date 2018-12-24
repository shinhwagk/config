#!/usr/bin/env bash

BASE=$(dirname $0);
DOWNS="$BASE/../downloads";

removeSuccess() {
  sudo docker ps -a --format '{{.Names}}' --filter ancestor='gk/youtube-dl' --filter 'exited=0' | while read line; do
    echo "$line download success."
    echo $line >> success;
    sudo docker rm $line;
  done
  cat success | while read line; do
    sed -i "/${line}/d" $DOWNS;
  done
}

beenDowndOrDowning() {
  local di=`sudo docker ps -a --format '{{.Names}}' --filter ancestor='gk/youtube-dl' --filter name=$1`
  local bd=`cat success | grep -v grep | grep $1 1>/dev/null && echo 1 || echo 0`
  if [ -z "$di" -a "$bd" == "0" ]; then
    echo 2 # no down.
  else
    echo 0 # down.
  fi
}

main() {
  removeSuccess;
  cat $DOWNS | while read line; do
    p1=`echo $line | awk '{print $1}'`
    p2=`echo $line | awk '{print $2}'`
    if [ $(beenDowndOrDowning $p1) == 2 ]; then
      echo "sudo docker run --name=${p1} --network=host -v `pwd`/$BASE/../movies:/youtube-dl -d gk/youtube-dl $p1 $p2"
      sudo docker run --name=${p1} --network=host -v `pwd`/$BASE/../youtube:/youtube-dl -d gk/youtube-dl $p1 $p2
    else
      echo "$p1 downing."
    fi
  done
}

main
