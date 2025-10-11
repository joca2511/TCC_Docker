Passo a Passo:
- Instalar Linux Jammy: 
    - Com Ansible:
        - Instalar ansible ([Link para documentação de instalação Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html))  
        ```
        $ sudo apt update
        $ sudo apt install software-properties-common
        $ sudo add-apt-repository --yes --update ppa:ansible/ansible
        $ sudo apt install ansible
        ```
        - Rodar playbook incluído com o repositório  
        ```
        $ sudo ansible-playbook playbook.yaml
        ```
    - Sem Ansible:  
        - Instalar ROS2 Humble ([Link para documentação de instalação ROS2](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html))  
        - Instalar Pacotes ROS2 ([Link para documentação de instalação dos Pacotes ROS2 necessários](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup))  
        - Adicionar variáveis ao .bashrc (ROS2, TURTLEBOT3_MODEL)  
        - Instalar Docker(Link para documentação de instalação docker)  
        - Atribuir usuário ao grupo docker  
        ```
        $ sudo groupadd docker  
        $ sudo usermod -aG docker $USER  
        $ newgrp docker
        ```
        - Compilar pacotes ROS2  
        ```
        $ colcon build --symlink-install
        ```
        
- 



Falta:  
Terminar passo-a-passo de dependencias
Talvez eventualmente permitir alimentar um arquivo para rotasRobos  

Comandos necessarios:  
!!!Lembrar de colocar usuario como x.org antes de logar, inves de wayland!  
!!!Lembrar de sempre rodar xhost +local:docker!  
apt update    
apt upgrade    

apt install nmon, xterm   
xhost +local:docker  
install docker engine  
install ros humble  


Ansible:  
instalar dependencias robotis/turtlebot3    

Falta colocar TURTLEBOT3_MODEL = TURTLEBOT3_BURGER no .bashrc  
Falta instanciar ros2 no .bashrc    
Falta compilar pacotes ROS2  
