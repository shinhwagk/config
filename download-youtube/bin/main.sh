#!/usr/bin/env bash

BASE=$(dirname $0);
DOWNS="$BASE/../youtube-dl.downloads";

download() {
  if [ $# == 1 ]; then
    youtube-dl --proxy socks5://127.0.0.1:1080 $1 &>/dev/null &
  else
    youtube-dl --proxy socks5://127.0.0.1:1080 $1 $2 &>/dev/null &
  fi
}

checkDownloading() {
  ps -ef | grep $1 | grep -v grep | wc -l
}

main() {
  cat $DOWNS | while read line
  do
    p1=`echo $line | awk '{print $1}'`
    p2=`echo $line | awk '{print $2}'`
    if [ `checkDownloading $p1` == 0 ]; then
      download $p1 $p2
    fi
  done
}

main
