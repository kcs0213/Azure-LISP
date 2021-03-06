# Deploy lab
url=https://raw.githubusercontent.com/Microsoft/Azure-LISP/master/lisp_lab_iterate_through_vnet.json

rg=lisplab
az group create -n $rg -l eastus
az group deployment create -g $rg --template-uri $url --parameters '{"adminPassword":{"value":"Msft123Msft123"}}'

# Check Public IP addresses
az network public-ip list -g $rg --query [].[name,ipAddress] -o tsv

# Cleanup
az group delete -n $rg -y --no-wait
