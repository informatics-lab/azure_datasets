#! /usr/bin/env bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for DEPLOYMENT in "met_office_big_4_models"
do
    echo "Launch deployment '${DEPLOYMENT}'."
    DEPLOYMENT_ROOT=$SCRIPT_DIR/../$DEPLOYMENT
    $DEPLOYMENT_ROOT/deploy.sh
    echo "Completed deployment '${DEPLOYMENT}'."
done
