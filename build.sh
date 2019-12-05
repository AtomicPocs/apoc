#!/bin/bash
set -eo pipefail

VERSION=1.1.0
IMAGE="docker.pkg.github.com/atomicpocs/apoc/apoc"

docker build -t $IMAGE:latest -t $IMAGE:$VERSION .
docker push $IMAGE:latest
docker push $IMAGE:$VERSION
