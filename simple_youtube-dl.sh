#!/usr/bin/env bash

youtube-dl -F --proxy socks5://127.0.0.1:1080 $1

read -p "number" number

youtube-dl -f $number --proxy socks5://127.0.0.1:1080 :$1
