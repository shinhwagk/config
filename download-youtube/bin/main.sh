#!/usr/bin/env bash

BASE=$(dirname $0);
DOWNS=$($BASE/../youtube-dl.downloads);

download() {
  if [ $# == 1 ]; then
    youtube-dl $1 &>/dev/null &
  else 
    youtube-dl $1 $2 &>/dev/null &
  fi
}

checkDownloading() {
  ps -ef | grep $1 | grep -v grep | wc -l
}

batchDownload() {
  cat $DOWNS | while read line
  do
    p1=`echo $line | awk '{print $1}'`
    p2=`echo $line | awk '{print $2}'`
    download $p1 $p2
  done
}

main() {
  batchDownload
}
