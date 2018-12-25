#!/usr/bin/env bash

download() {
  local fcode=$2
  if [ $# == 1 ]; then
    fcode="bestvideo"
  fi
  echo "youtube-dl -f $fcode --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=$1"
  youtube-dl -f $fcode --proxy socks5://127.0.0.1:1080 https://www.youtube.com/watch?v=$1
}

download $@
