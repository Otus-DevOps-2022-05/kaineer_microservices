ADDRESS=$(yc compute instance list --format=json | jq -r .[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address)

echo "docker swarm init --advertise-addr=${ADDRESS}"
docker swarm init --advertise-addr=${ADDRESS}
