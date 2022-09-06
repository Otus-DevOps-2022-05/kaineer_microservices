# Install docker
sudo apt-get update
sudo apt-get install -y docker docker-compose

# Add yourself to docker group
sudo usermod -aG docker $USER

# Start next script after that
exit
