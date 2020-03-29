#!/bin/bash
APP_YAML=app.yaml
mv ${APP_YAML} ${APP_YAML}.bak
cat ${APP_YAML}.bak | sed -e "s/{{ google.api.api-key }}/${GOOGLE_API_API_KEY}/g" > ${APP_YAML}
gradle appengineStage
gradle appengineDeploy
mv ${APP_YAML}.bak ${APP_YAML}
