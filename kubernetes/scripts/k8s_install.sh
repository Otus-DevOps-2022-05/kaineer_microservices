#!/bin/bash

# Runs bootstrap.sh on both VMs

cat ./bootstrap.sh | ssh -i ~/.ssh/appuser ubuntu@51.250.78.80
cat ./bootstrap.sh | ssh -i ~/.ssh/appuser ubuntu@84.201.173.102
