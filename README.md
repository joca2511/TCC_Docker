# Passo a Passo de instalação/Setup:
- Instalar Linux Jammy 
- Inicializar sessão linux com x.org e não wayland, para conseguir configurar xhost
- Habilitar xhost para o container Docker:
```
$ xhost +local:docker
```
- Instalar dependências:   
    - ## Com Ansible:
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
        
    - ## Sem Ansible:  
        - Instalar dependencias apt:
        ```
        $ sudo apt update
        $ sudo apt upgrade
        $ sudo apt install -y xterm nmon
        ```
        - Instalar ROS2 Humble ([Link para documentação de instalação ROS2](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html))  
        - Instalar Pacotes ROS2 ([Link para documentação de instalação dos Pacotes ROS2 necessários](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup))  
        - Adicionar variáveis ao .bashrc (Altere {Caminho_Até_Pasta_Repo} com o diretório da pasta do repositório ) 
        ```
        $ echo "export ROS_DOMAIN_ID=30" >> ~/.bashrc
        $ echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
        $ echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
        $ echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc
        $ echo "source {Caminho_Até_Pasta_Repo}/install/setup.bash" >> ~/.bashrc
        ``` 
        - Instalar Docker([Link para documentação de instalação docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository))  
        - Atribuir usuário ao grupo docker  
        ```
        $ sudo groupadd docker  
        $ sudo usermod -aG docker $USER  
        $ newgrp docker
        ```
        - Compilar Pacotes ROS2 (Certifique-se que está rodando o comando dentro do diretório principal do repo, aonde a pasta src está localizada!)  
        ```
        $ colcon build --symlink-install
        ```
# Explicação dos scripts
- Se certificar que exista a pasta desejada dentro de "nmon_logs" para armazenar suas informações
- Se certificar que o Mapa desejado esteja dentro de tcc/worlds, e repetir o passo de Compilar Pacotes ROS2
- Se certificar que o SLAM do mapa desejado esteja dentro da pasta slams
- Se certificar que esteja rodando os scripts dentro do diretório principal do repositório
- Scripts <b>inicioRapido</b>:
    - Necessitam de 3 argumentos para rodar testes
        - Formato:
        ```
        {Script iniciorapido} {NomeDaPastaDeResultados} {NomeDoMapa} {NomeDoSlam}
        ```
        - Exemplo<br>Salvar os resultados do teste com Patrulheiros na pasta <b>Patrulha</b>, no mapa <b>Arena</b>, com o SLAM <b>Arena</b>:
        ```
        $ inicioRapidoPatrulha.sh Patrulha Arena Arena
        ```
        - Diferenças entre os scripts:
            - Scripts com <b>Patrulha</b> instanciam robos que fazem uma rota de patrulha repetitiva em partes específicas do mapa, com o intuituo de atrapalhar a navegação do robô principal
            - Scripts com <b>Docker</b> inicializa a stack nav2 do robô principal dentro de um container Docker, se comunicando com o ros2 nativo para movimentar o robô simulado, com o intuito de testar o desempenho da navegação do robô simulado dentro do container

- Scripts de <b>autoTeste</b>:
    - Utilizam os scripts de <b>inicioRapido</b>, os colocando em um loop infinito de teste, que deve ser cancelado via terminal por Ctrl+C
- Scripts de auxílio na pasta <b>scripts</b>
    - iniciarNmon.sh
        - Inicializa o Nmon e começa a salvar os dados em um novo arquivo dentro da pasta especificada
    - instanciarArena.sh
        - Instancia a Arena especificada
    - instanciarPatrulheiros.sh
        - Instancia os patrulheiros no Mapa
    - rotasRobos.sh
        - Movimenta os patrulheiros instanciados para as posições especificadas, seguindo o seguinte padrão:
        ```
        $ ros2 run tcc turtlebot3_absolute_move_Arena {NomeRobo} {X1} {Y1} {Grau1} {X0} {Y0} {Grau0}
        ```
        - Onde {NomeRobo} é o nome do robo nos tópicos ROS2, ({X},{Y},{Grau}) sendo as posições X, Y e o grau de rotação que o robô deve ter
    - matarXterm.sh
        - Manda SIGINT para todos os terminais xterm, os fechando de forma segura
    - moverMain.sh
        - Inicializa a stack nav2 de navegação, e manda um objetivo de pose para o mesmo, fazendo o robô se movimentar para completa-lo
    - pararNmon.sh
        - Interrompe a escrita de log atual do nmon, a salvando



