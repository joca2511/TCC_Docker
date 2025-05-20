FROM ros:humble

##instalar gazebo
RUN apt-get update
##RUN sudo apt-get install -y ignition-fortress

##pacotes para compatibilidade humble-gazebo
##RUN sudo apt-get install -y ros-humble-ros-gz

##instalar miscelaneos
RUN sudo apt-get install -y vim wget

RUN mkdir -p /dockerteste/src


##faz build do projeto e altera o diretorio inicial
WORKDIR /dockerteste/src
RUN git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
WORKDIR /dockerteste
RUN rosdep install -i --from-path src --rosdistro humble -y
##rodar source do ros2 antes de usar colcon
RUN source ./opt/ros/humble/setup.bash && colcon build --symlink-install
##rodar source do projeto antes de rodar o simulador
##declarar variavel de instancia antes de rodar simulador (export TURTLEBOT3_MODEL=burger)

##ros2 launch -d turtlebot3_gazebo turtlebot3_house.launch.py 

##ros2 run turtlebot3_gazebo turtlebot3_drive 


   
##declarando o source, para nao ter que fazer em toda inicializacao de terminal bash ##(nao funciona)
##RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
##RUN echo "source /dockerteste/install/setup.bash" >> ~/.bashrc

##coloca o display do docker como o display 0
##ENV DISPLAY=host.docker.internal:0.0

## teste ros (precisa de display):
## ros2 run turtlesim turtlesim_node
