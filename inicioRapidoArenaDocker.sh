#!/bin/bash

./scripts/iniciarNmon.sh ArenaDocker
./scripts/instanciarArena.sh
sleep 20
#./scripts/moverMain.sh
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
