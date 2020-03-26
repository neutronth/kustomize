#!/bin/sh

GITCOMMIT=$(git rev-parse --verify HEAD)
BUILDDATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
BUILD_OPTS=

if [ "x$1" = "x--debug" ]; then
  BUILD_OPTS="-x"
fi

go build $BUILD_OPTS \
  -ldflags " \
  -X sigs.k8s.io/kustomize/api/provenance.version=3.5.4+ksops \
  -X sigs.k8s.io/kustomize/api/provenance.gitCommit=$GITCOMMIT \
  -X sigs.k8s.io/kustomize/api/provenance.buildDate=$BUILDDATE \
  "
