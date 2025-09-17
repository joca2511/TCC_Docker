#!/bin/bash

xterm -T "Terminal 1" -e "bash -c 'ros2 launch tcc turtlebot3_Arena.launch.py name:=$1; exec bash'" &
