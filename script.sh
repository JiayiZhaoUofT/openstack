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
export OS_TOKEN=$content
echo $OS_TOKEN
curl -s \
-H "Content-Type: application/json" \
-H "X-Auth-Token:$OS_TOKEN" \
-d '
{
"subnet": {
"network_id": "7697d4c6-5b4c-4ea9-a1d6-af7d7f716f2b",

"ip_version": 4,
"cidr": "192.168.199.0/24"
}
}' "http://localhost:9696/v2.0/subnets" ; echo
