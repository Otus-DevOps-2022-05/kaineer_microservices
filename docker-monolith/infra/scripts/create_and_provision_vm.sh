#!/bin/bash

BIN=${TERRAFORM:-terraform}

cd terraform

source .envrc

$BIN init
# $BIN plan
$BIN apply -auto-approve

cd -
