#!/usr/bin/env bash
BASE=$(cd "$(dirname $0)"/../; pwd);
DOWNS="$BASE/downloads";
SUCCESS="$BASE/success";
MOVIES="$BASE/movies";

removeSuccess() {
  sudo docker ps -a --format '{{.Names}}' --filter ancestor='gk/youtube-dl' --filter 'exited=0' | while read line; do
    echo "$line download success."
    echo ${line:3} >> $SUCCESS;
    sudo docker rm $line;
  done
  cat $SUCCESS | while read line; do
    sed -i "/${line}/d" $DOWNS;
  done
}

beenDowndOrDowning() {
  local di=`sudo docker ps -a --format '{{.Names}}' --filter ancestor='gk/youtube-dl' --filter name=yd-$1`
  local bd=`cat $SUCCESS | grep -v grep | grep $1 1>/dev/null && echo 1 || echo 0`
  if [ -z "$di" -a "$bd" == "0" ]; then
    echo 2 # no down.
  else
    echo 0 # down.
  fi
}

downFromDownloads() {
  cat $DOWNS | while read line; do
    p1=`echo $line | awk '{print $1}'`
    p2=`echo $line | awk '{print $2}'`
    if [ $(beenDowndOrDowning $p1) == 2 ]; then
      echo "sudo docker run --name=yd-${p1} --network=host -v $MOVIES:/youtube-dl -d gk/youtube-dl $p1 $p2"
      sudo docker run --name=yd-${p1} --network=host -v $MOVIES:/youtube-dl -d gk/youtube-dl $p1 $p2
    else
      echo "$p1 downing."
    fi
  done  
}

appendDownloads() {
  [ -z $1 ] || echo $1 >> $DOWNS
}

main() {
  removeSuccess;
  sudo docker start $(docker ps -aq  --filter ancestor='gk/youtube-dl' --filter 'exited=1')
  appendDownloads $1
}

main $@
