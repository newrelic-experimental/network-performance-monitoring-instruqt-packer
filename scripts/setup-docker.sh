sudo usermod -aG docker $USER
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock

docker swarm init
docker network create -d overlay --subnet=10.10.0.0/24 --attachable testnet

docker run -d --name cisco-switch --restart always --network=testnet -v lab-config/snmpwalks/cisco-switch:/usr/local/snmpsim/data -p 161:161/udp tandrup/snmpsim
docker run -d --name linksys-router --restart always --network=testnet -v lab-config/snmpwalks/linksys-router:/usr/local/snmpsim/data -p 163:161/udp tandrup/snmpsim
docker run -d --name workstation-1 --restart always --network=testnet -v lab-config/snmpwalks/workstation-1:/usr/local/snmpsim/data -p 164:161/udp tandrup/snmpsim
docker run -d --name workstation-2 --restart always --network=testnet -v lab-config/snmpwalks/workstation-2:/usr/local/snmpsim/data -p 165:161/udp tandrup/snmpsim
docker run -d --name workstation-3 --restart always --network=testnet -v lab-config/snmpwalks/workstation-3:/usr/local/snmpsim/data -p 166:161/udp tandrup/snmpsim
