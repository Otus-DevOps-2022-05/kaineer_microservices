ADDRESS=$(yc compute instance list --format=json | jq -r .[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address)

if [[ "$ADDRESS" == "null" ]]; then
  echo " ! VM not found, run ./scripts/create-instanse.sh"
else
  ssh yc-user@${ADDRESS} -i ~/.ssh/appuser $@
fi
