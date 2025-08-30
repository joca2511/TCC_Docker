#!/bin/bash

./instanciarArena.sh
./instanciarPatrulheiros.sh
sleep 10
./rotasRobos.sh
sleep 15
./moverMain.sh
