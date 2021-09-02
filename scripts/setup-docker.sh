sudo usermod -aG docker $USER
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock

docker swarm init
docker network create -d overlay --subnet=10.10.0.0/24 --attachable testnet

git clone https://github.com/newrelic-experimental/network-performance-monitoring-instruqt-packer

docker run -d --name=cisco-router-1 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-router-1:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-router-2 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-router-2:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-router-3 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-router-3:/usr/local/snmpsim/data tandrup/snmpsim

docker run -d --name=cisco-switch-1 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-1:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-2 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-2:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-3 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-3:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-4 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-4:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-5 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-5:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-6 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-6:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-7 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-7:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-8 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-8:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-9 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-9:/usr/local/snmpsim/data tandrup/snmpsim
docker run -d --name=cisco-switch-10 --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch-10:/usr/local/snmpsim/data tandrup/snmpsim

docker run -d --name=linksys-router --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/linksys-router:/usr/local/snmpsim/data tandrup/snmpsim
