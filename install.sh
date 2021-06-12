#!/bin/bash

CWD=`pwd`
BUILD=$CWD"/build"
EMACS_GIT="https://github.com/emacs-mirror/emacs.git"

sudo apt-get install build-essential libgtk-3-dev libxpm-dev libjpeg-dev libgif-dev libtiff-dev libssl-dev libgnutls28-dev libncurses5-dev texinfo

if [[ ! -d $BUILD ]]
then
  mkdir -pv $BUILD
fi
pushd $BUILD
  if [[ -d ".git" ]]
  then
    git pull
  else
    git clone $EMACS_GIT $BUILD
  fi
  ./autogen.sh
  ./configure --with-x
  make
  sudo make install
popd
