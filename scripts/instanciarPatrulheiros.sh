#!/bin/bash

xterm -T "Terminal 2" -e "bash -c 'ros2 launch tcc multi_robot_Arena.launch.py; exec bash'" &
