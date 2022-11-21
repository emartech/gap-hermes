#!/bin/sh

set -e

if [ -z "$GOOGLE_GHA_CREDS_PATH" ]; then
    echo "Google credentials are absent. Did you include the checkout and auth steps in your configuration?"
    exit 1
fi

export HOME=`pwd`

gcloud auth login --cred-file=$GOOGLE_GHA_CREDS_PATH

gsutil cp gs://ems-gap-deploy/gap-hermes.sh .

chmod +x ./gap-hermes.sh

bash ./gap-hermes.sh
