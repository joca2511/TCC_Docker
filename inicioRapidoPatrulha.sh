#!/bin/bash

./scripts/iniciarNmon.sh Patrulha
./scripts/instanciarArena.sh Arena.world
./scripts/instanciarPatrulheiros.sh
sleep 10
./scripts/rotasRobos.sh
sleep 15
./scripts/moverMain.sh
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
