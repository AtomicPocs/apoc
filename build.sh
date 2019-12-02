#!/bin/sh
set -eo pipefail

VERSION=1.0.0
REGISTRY="zupmeqa.azurecr.io/atomicpocs"
PROJECT="apoc"
IMAGE="${REGISTRY}/${PROJECT}"

docker build -t $IMAGE:latest -t $IMAGE:$VERSION .
docker push $IMAGE:latest
docker push $IMAGE:$VERSION
