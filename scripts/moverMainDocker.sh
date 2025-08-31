#!/bin/bash

xterm -T "Terminal 6" -e "bash -c 'ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=./maps/mapaBase.yaml params_file:=./burger.yaml; exec bash'" &

sleep 10
xterm -T "Terminal 8" -e "bash -c 'ros2 action send_goal /navigate_to_pose nav2_msgs/action/NavigateToPose \"{
  pose: {
    header: {frame_id: 'map'},
    pose: {
      position: {x: 2.0, y: 1.0, z: 0.0},
      orientation: {z: 0.0, w: 1.0}
    }
  }
}\"
; exec bash'" 

exit



