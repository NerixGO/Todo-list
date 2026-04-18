#!/bin/bash

mkdir -p ~/.local/bin
mkdir -p ~/.local/share/td

cp $PWD/td.sh ~/.local/bin/td

chmod +x ~/.local/bin/td

touch ~/.local/share/td/td.txt

echo "Installed td successfully"
