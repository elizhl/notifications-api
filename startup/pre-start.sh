#!/bin/bash
set -e

env | grep CONSUL

export CUSTOM_CMD="$@"

if [ $CONSUL_HTTP_SSL == "true" ]; then
	echo "SSL IS ENABLED"
  curl_ssl="--cacert ${CA_CERT_FILE}"
fi

if [ -n $CONSUL_HTTP_TOKEN ]; then
	echo "Setting consul token"
	header="--header \"X-Consul-Token: $CONSUL_HTTP_TOKEN\""
fi

if [ -z $START_CMD ]; then
	echo "Setting custom command as the startup command"
	export START_CMD=${CUSTOM_CMD}
fi

exec $START_CMD
