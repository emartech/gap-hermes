#!/bin/sh

set -ex

export HOME=`pwd`

gcloud auth login --cred-file=$CRED_FILE_PATH

gsutil cp gs://ems-gap-deploy/gap-hermes.sh .

chmod +x ./gap-hermes.sh

bash ./gap-hermes.sh
