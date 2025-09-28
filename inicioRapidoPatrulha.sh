#!/bin/bash

./scripts/iniciarNmon.sh $1
./scripts/instanciarArena.sh $2.world
./scripts/instanciarPatrulheiros.sh
sleep 10
./scripts/rotasRobos.sh
sleep 15
./scripts/moverMain.sh $3
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
