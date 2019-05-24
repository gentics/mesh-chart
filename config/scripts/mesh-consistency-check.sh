#!/bin/sh

set -euxo pipefail
source ./mesh-login.sh
curl http://$MESH_HOST/api/v1/admin/consistency/check  -H 'Cookie: mesh.token='$MESH_TOKEN -v
