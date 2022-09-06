#!/bin/bash

BIN=${TERRAFORM:-terraform}

cd terraform

source .envrc

$BIN destroy -auto-approve

cd -

rm ansible/inventory
