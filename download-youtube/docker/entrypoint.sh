#!/usr/bin/env bash

maxFormatCode() {
  youtube-dl --proxy socks5://127.0.0.1:1080 -F https://www.youtube.com/watch?v=${1} | sed '1,4d' | sort -n -k 1 -r | head -1 | awk '{print $1}'
}

download() {
  local fcode=$2
  if [ $# == 1 ]; then
    fcode=$(maxFormatCode $1)
  fi
  echo "youtube-dl -f $fcode --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=$"
  youtube-dl -f $fcode --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=$1
}

download $@
