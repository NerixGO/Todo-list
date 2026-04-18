#!/bin/bash

if [[ -z $1 ]]; then
  printf "\n ----- \n Use: “todo list” to show todo list \n Use: “todo add [name]” to add todo \n ----- \n\n"
  exit 1
fi

if [ "$1" = "list" ]; then
  cat ~/Projects/Todo-list/todo.txt
  exit 0
fi

if [ -z "$2" ]; then
  cat ~/Projects/Todo-list/todo.txt
  exit 0
elif [ "$1" = "add" ]; then
  echo "- [] $2" >>/home/devax/Projects/Todo-list/todo.txt
  exit 0
elif [ "$1" = "done" ]; then
  sed -i "s/- \[\] $2/- [x] $2/" ~/Projects/Todo-list/todo.txt
  exit 0
elif [ "$1" = "remove" ]; then
  sed -i "\|$2|d" ~/Projects/Todo-list/todo.txt
  exit 0
fi
