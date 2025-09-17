#!/bin/bash

./scripts/iniciarNmon.sh Arena
./scripts/instanciarArena.sh Arena.world
sleep 20
./scripts/moverMain.sh
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
