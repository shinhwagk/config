#!/usr/bin/env bash

sed -i 's/archive\.ubuntu/mirrors\.aliyun/g' /etc/apt/sources.list
sed -i 's/security\.ubuntu/mirrors\.aliyun/g' /etc/apt/sources.list
