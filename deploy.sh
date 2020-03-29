#!/bin/bash -eu
APP_YAML=app.yaml
mv ${APP_YAML} ${APP_YAML}.bak
cat ${APP_YAML}.bak | sed -e "s/{{ google.api.api-key }}/${GOOGLE_API_API_KEY}/g" \
  | sed -e"s/{{ BASIC_USERNAME }}/${BASIC_USERNAME}/g" \
  | sed -e"s/{{ BASIC_PASSWORD }}/${BASIC_PASSWORD}/g" > ${APP_YAML}
gcloud app deploy
mv ${APP_YAML}.bak ${APP_YAML}
