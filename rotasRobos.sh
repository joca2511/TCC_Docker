#!/bin/bash

gnome-terminal --tab --title="Terminal 1" --command="bash -c 'ros2 launch TCC turtlebot3_Arena.launch.py; $SHELL'" &

gnome-terminal --tab --title="Terminal 2" --command="bash -c 'ros2 launch TCC multi_robot_Arena.launch.py; $SHELL'" & 

sleep 10



gnome-terminal --tab --title="Terminal 3" --command="bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_1 1.3 2.5 180 0.15 2.5 0; 
$SHELL'" &

gnome-terminal --tab --title="Terminal 4" --command="bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_2 1.5 2.7 90 1.5 4.8 270; $SHELL'" &


gnome-terminal --tab --title="Terminal 5" --command="bash -c 'ros2 run TCC turtlebot3_absolute_move_Arena TB3_3 3.8 2.5 180 2.5 2.5 0; $SHELL'" &

gnome-terminal --tab --title="Terminal 6" --command="bash -c 'ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=./maps/mapaBase.yaml; $SHELL'" & 
