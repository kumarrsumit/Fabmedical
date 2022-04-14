#!/bin/bash

# Public IP address
IP="20.232.111.98"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-587698_fabmedical-587698_eastus"

# Name to associate with public IP address
DNSNAME="fabmedical-587698-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME