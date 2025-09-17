#!/bin/bash


./scripts/iniciarNmon.sh ArenaDocker
./scripts/instanciarArena.sh Arena.world
sleep 20
docker compose run --rm ros2 bash -c "source /opt/ros/humble/setup.bash && source ./install/setup.bash && ./scripts/moverMain.sh"
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
