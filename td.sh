#!/bin/bash

if [[ -z $1 ]]; then
  printf "\n ----- \n Use: “td list” to show task list \n Use: “td add [name]” to add task  \n Use: "td done [name]" to do task \n Use: "td remove [name]" to remove task\n ----- \n"
  exit 1
fi

if [ "$1" = "list" ]; then
  cat ~/.local/share/td/td.txt
  exit 0
fi

if [ "$1" = "add" ]; then
  if [ -z "$2" ]; then
    echo "You can't add nothing"
    exit 0
  fi
  echo "- [] $2" >>~/.local/share/td/td.txt
  exit 0
elif [ "$1" = "done" ]; then
  sed -i "s/- \[\] $2/- [x] $2/" ~/.local/share/td/td.txt
  exit 0
elif [ "$1" = "remove" ]; then
  sed -i "\|- \[.\] $2|d" ~/.local/share/td/td.txt
  exit 0
fi
