FROM ros:humble

##atualizar imagem
RUN sudo apt-get -y upgrade
RUN apt-get update

##pacotes para compatibilidade humble-gazebo
RUN sudo apt-get install -y ros-humble-ros-gz

##instalar miscelaneos
RUN sudo apt-get install -y vim wget ros-humble-demo-nodes-cpp iputils-ping ros-humble-rmw-cyclonedds-cpp

#cria diretorio para o repositorio do github
RUN mkdir -p /dockerteste/src

##faz download do projeto presente no github
WORKDIR /dockerteste/src
RUN git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

##faz download das dependencias do projeto, e muda o diretorio inicial
WORKDIR /dockerteste
RUN rosdep install -i --from-path src --rosdistro humble -y

##declarando o source, para nao ter que fazer em toda inicializacao de terminal bash
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

