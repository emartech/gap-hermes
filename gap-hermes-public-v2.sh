#!/bin/sh

set -e

export HOME=`pwd`

gsutil cp gs://ems-gap-deploy/gap-hermes.sh .

chmod +x ./gap-hermes.sh

sh ./gap-hermes.sh
