#!/bin/bash

xterm -T "Terminal 1" -e "bash -c 'ros2 launch TCC turtlebot3_Arena.launch.py; exec bash'" &

xterm -T "Terminal 2" -e "bash -c 'ros2 launch TCC multi_robot_Arena.launch.py; exec bash'" &