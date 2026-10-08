#!/usr/bin/env bash
# Print the current kube context and namespace for the herdr tab bar.
# Runs on the herdr server, so it reflects the server's KUBECONFIG, not the focused pane.
# Usage: herdr-kube-context.sh  ->  ctx/namespace

command -v kubectl >/dev/null 2>&1 || { echo "-"; exit 0; }

out=$(kubectl config view --minify -o jsonpath='{.current-context}{"|"}{..namespace}' 2>/dev/null)
ctx=${out%%|*}
ns=${out#*|}

[ -z "$ctx" ] && { echo "-"; exit 0; }

# Shorten long cloud context names:
#   arn:aws:eks:us-east-1:123456789012:cluster/foo -> foo
#   gke_project_region_foo                         -> foo
case "$ctx" in
  arn:aws:eks:*) ctx=${ctx##*/} ;;
  gke_*) ctx=${ctx##*_} ;;
esac

echo "⎈ ${ctx}/${ns:-default}"
