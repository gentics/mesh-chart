#!/bin/sh

set -euxo pipefail
source ./mesh-login.sh
curl -X POST http://$MESH_HOST/api/v1/search/sync  -H 'Cookie: mesh.token='$MESH_TOKEN -v
