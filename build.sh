#!/usr/bin/env bash

directory="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

docker run --rm -i -v /var/run/docker.sock:/var/run/docker.sock -v bin:${directory}/bin docker sh <<EOF 

apk update && \
apk upgrade && \
apk upgrade && \
apk add git \
        make

mkdir -p ${directory} && \
cd ${directory}

git clone https://github.com/awslabs/amazon-ecr-credential-helper && \
cd amazon-ecr-credential-helper && \
make docker

EOF

docker build -t aws-ecr-helper ${directory}
