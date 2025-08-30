#!/bin/bash

xterm -T "Terminal 1" -e "bash -c 'ros2 launch tcc turtlebot3_Arena.launch.py; exec bash'" &
