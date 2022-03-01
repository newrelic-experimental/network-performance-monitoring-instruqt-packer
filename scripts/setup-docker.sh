sudo usermod -aG docker $USER
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock

git clone https://github.com/newrelic-experimental/network-performance-monitoring-instruqt-packer
