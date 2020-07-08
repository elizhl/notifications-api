#!/bin/bash

# Download consul-template
export CONSUL_TEMPLATE_VERSION=0.22.0
curl -s https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o consul-template.zip

# Install consul-template
unzip consul-template.zip
chmod +x consul-template
mv consul-template /usr/bin/consul-template
rm consul-template.zip 