#!/bin/bash

xterm -T "Terminal 3" -e "bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_1 1.3 2.5 180 0.15 2.5 0; exec bash'" &

xterm -T "Terminal 4" -e "bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_2 1.5 2.7 90 1.5 4.8 270; exec bash'" &

xterm -T "Terminal 5" -e "bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_3 3.8 2.5 180 2.5 2.5 0; exec bash'" &

xterm -T "Terminal 6" -e "bash -c 'ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=./maps/mapaBase.yaml; exec bash'" &

