#!/bin/bash

set -e

HOMESICK_NAME=$(basename $HOMESICK_REPO .git)

if [ -d /ssh ] && [ ! -d $HOME/.ssh ]; then
  mkdir $HOME/.ssh
  cp /ssh/* $HOME/.ssh/
  chmod 600 $HOME/.ssh/*
  eval $(ssh-agent)
  ssh-add
fi

if [ $HOMESICK_REPO ] && [ ! -d $HOME/.homesick/repos/$HOMESICK_NAME ]; then
  gem install homesick
  homesick clone $HOMESICK_REPO
  homesick symlink $HOMESICK_NAME
fi

exec "$@"
