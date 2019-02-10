#!/bin/bash
content=$(curl -i \
     -H "Content-Type: application/json" \
     -d '
   { "auth": {
       "identity": {
         "methods": ["password"],
         "password": {
           "user": {
             "name": "admin",
             "domain": { "id": "default" },
             "password": "secret"
} }
}, "scope": {
         "project": {
           "name": "admin",
           "domain": { "id": "default" }
} }
} }' \
http://localhost/identity/v3/auth/tokens | grep -oP '(X-Subject-Token: \K\w+).*')
export OS_TOKEN=${content//$'\015'}
#List of VMs:
curl -s -H "X-Auth-Token: $OS_TOKEN" "http://localhost/compute/v2.1/networks"
