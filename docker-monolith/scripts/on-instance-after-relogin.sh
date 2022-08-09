# Start a swarm
docker swarm init

# This will display command to join on another host
# Do NOT forget replace IP with external one!!!
docker swarm join-token worker
