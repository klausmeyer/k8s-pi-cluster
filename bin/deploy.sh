#!/usr/bin/env bash

set -e
set -o pipefail
set -u

cd "./deployments/${CHART}"

if [ -f "./Chart.lock" ]; then
  yq -r --indent 0 '.dependencies | map(["helm", "repo", "add", .name, .repository] | join(" ")) | .[]' "./Chart.lock"  | sh --;
fi

helm dependency build
helm template --create-namespace -n "${NAMESPACE}" "${RELEASE}" .
helm upgrade --install --create-namespace -n "${NAMESPACE}" "${RELEASE}" .
