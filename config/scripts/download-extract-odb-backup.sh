#!/bin/sh
set -euxo pipefail
mkdir -p /root/tmp && cd /root/tmp
if [ -z $1 ]; then echo "First arg should be an url to an OrientDB backup zip file"; exit 1; fi
curl $1 -o odb-backup.zip
rm -rf odb-backup/ && mkdir odb-backup/ && unzip odb-backup.zip -d ./odb-backup && chown -R 1000:1000 ./odb-backup