Falta:  
Terminar passo-a-passo de dependencias
Decidir como visualizar usando pidstat (Excel, script em python etc.)  
Talvez eventualmente permitir alimentar um arquivo para rotasRobos  

Comandos necessarios:  
!!!Lembrar de colocar usuario como x.org antes de logar, inves de wayland!  
  
apt update  
apt upgrade  

apt install nmon, xterm  
xhost +local:docker  
install docker engine  
install ros humble  

  
instalar dependencias robotis/turtlebot3  

para arquivo ansible, não esquecer de configurar user!

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
 


