#!/bin/sh

set -euxo pipefail
echo 'Using MESH_HOST='$MESH_HOST
export MESH_TOKEN=$(curl -X POST http://$MESH_HOST/api/v1/auth/login -H 'accept: application/json' -H 'content-type: application/json' -d '{"username" : "admin","password" : "admin"} ' | jq .token )
echo 'Authenticated with MESH_TOKEN='$MESH_TOKEN
