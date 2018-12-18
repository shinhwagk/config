#!/usr/bin/bash env

if [ ! -d ~/.pyenv ]; then
  git clone --depth=1 https://github.com/pyenv/pyenv.git ~/.pyenv
fi
