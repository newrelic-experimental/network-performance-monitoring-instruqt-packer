sudo usermod -aG docker $USER
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock

docker swarm init
docker network create -d overlay --subnet=10.10.0.0/24 --attachable testnet

git clone https://github.com/newrelic-experimental/network-performance-monitoring-instruqt-packer

docker run -d --name=cisco-router --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-router:/usr/local/snmpsim/data tandrup/snmpsim

docker run -d --name=cisco-switch --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/cisco-switch:/usr/local/snmpsim/data tandrup/snmpsim

docker run -d --name=linksys-router --restart=always --network=testnet --privileged -v /:/rootfs:ro -v /etc/localtime:/etc/localtime:ro -v /home/packer/network-performance-monitoring-instruqt-packer/files/linksys-router:/usr/local/snmpsim/data tandrup/snmpsim
