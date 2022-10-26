#!/bin/sh

set -e

activateGoogleCloudServiceAccount () {
  if [ -z "$GAP_DEPLOY_GOOGLE_AUTH" ]; then
      echo "GAP_DEPLOY_GOOGLE_AUTH is not set. This needs to be the base64 encoded Google JSON key file of the area deployer."
      exit 1
  fi

  echo ${GAP_DEPLOY_GOOGLE_AUTH} | base64 -d > /tmp/auth.json
  gcloud auth activate-service-account --key-file=/tmp/auth.json
  rm -f /tmp/auth.json
}

export HOME=`pwd`

activateGoogleCloudServiceAccount

gsutil cp gs://ems-gap-deploy/gap-hermes.sh .

chmod +x ./gap-hermes.sh

bash ./gap-hermes.sh
