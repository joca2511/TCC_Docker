#!/bin/bash

./scripts/iniciarNmon.sh $1
./scripts/instanciarArena.sh $2.world
sleep 20
./scripts/moverMain.sh $3
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
