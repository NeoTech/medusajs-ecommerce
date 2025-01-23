#!/bin/bash -e
set -euo pipefail
OUT=./certs/
mkdir -p ${OUT}
openssl req -new -text -passout pass:abcd -subj /CN=localhost -out ${OUT}server.req -keyout ${OUT}privkey.pem
openssl rsa -in ${OUT}privkey.pem -passin pass:abcd -out ${OUT}server.key
openssl req -x509 -in ${OUT}server.req -text -key ${OUT}server.key -out ${OUT}server.crt
chmod 600 ${OUT}server.key
sudo chown 70:70 ${OUT}server.key
sudo chown 70:70 ${OUT}server.crt
