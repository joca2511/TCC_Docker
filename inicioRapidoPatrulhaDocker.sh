#!/bin/bash

./scripts/iniciarNmon.sh Patrulha
./scripts/instanciarArena.sh
./scripts/instanciarPatrulheiros.sh
sleep 10
./scripts/rotasRobos.sh
sleep 15
docker compose run --rm ros2 bash -c "source /opt/ros/humble/setup.bash && source ./install/setup.bash && ./scripts/moverMain.sh"
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
