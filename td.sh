#!/bin/bash

if [ "$1" = "-h" ]; then
  printf "\n -----
  Use: “td list” to show task list 
  Use: “td add [name]” to add task  
  Use: “td done [name]” to do task 
  Use: “td done [name]” to remove task

  Or type “td -h” to see this text
  \n ----- \n\n"
  exit 1
fi

if [ -z "$1"]; then
  cat ~/.local/share/td/td.txt
  exit 0
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
