#!/bin/bash
xterm -T "Terminal Docker" -e "bash -c 'sudo docker compose up; exec bash'" &
./scripts/iniciarNmon.sh ArenaDocker
./scripts/instanciarArena.sh
sleep 20
sudo docker exec turtlebot3 bash -ic "./scripts/moverMainDocker.sh"
./scripts/pararNmon.sh
./scripts/matarXTerm.sh
