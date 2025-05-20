FROM ros:humble

##instalar gazebo
RUN apt-get update
##RUN sudo apt-get install -y ignition-fortress

##pacotes para compatibilidade humble-gazebo
##RUN sudo apt-get install -y ros-humble-ros-gz

##instalar miscelaneos
RUN sudo apt-get install -y vim wget

##copiando arquivos de teste
COPY . /dockerteste

##faz build do projeto e altera o diretorio inicial
WORKDIR /dockerteste
RUN rosdep install -i --from-path src --rosdistro humble -y && \
    colcon build --symlink-install

##declarando o source, para nao ter que fazer em toda inicializacao de terminal bash ##(nao funciona)
##RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
##RUN echo "source /dockerteste/install/setup.bash" >> ~/.bashrc

##coloca o display do docker como o display 0
##ENV DISPLAY=host.docker.internal:0.0

## teste ros (precisa de display):
## ros2 run turtlesim turtlesim_node
