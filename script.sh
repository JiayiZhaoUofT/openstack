curl -i \
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
http://localhost/identity/v3/auth/tokens