ADDRESS=$(yc compute instance list --format=json | jq -r .[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address)

echo "Address: $ADDRESS"
