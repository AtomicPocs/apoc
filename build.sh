#!/bin/sh
set -eo pipefail

VERSION=1.0.0
REGISTRY="zupmeqa.azurecr.io/atomicpocs"
IMAGE="${REGISTRY}/apoc"

docker build -t $IMAGE:latest -t $IMAGE:$VERSION .
docker push $IMAGE:latest
docker push $IMAGE:$VERSION
