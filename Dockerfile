FROM python:2.7

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt


COPY startup /tmp/
COPY files/bin /tmp/
COPY files/template /tmp/

COPY files/consul-agent-ca.pem /tmp/
COPY files/ct.hcl /tmp/
COPY files/ct-config.hcl /tmp/
COPY files/envconsul.hcl.tmpl /tmp/

RUN chmod -R +x /tmp && /tmp/installhashi.sh

#Container ENV's
ENV CONSUL_SCHEME https
ENV CONSUL_IP 172.20.20.11
ENV CONSUL_PORT 8500
ENV CONSUL_HTTP_SSL true
ENV CA_CERT_FILE /tmp/consul-agent-ca.pem
ENV CONSUL_HTTP_TOKEN fe1fcdd5-0daf-bcfc-6f55-a8b5c08abd20

ENV IS_ENTRY_POINT true
ENV ACTIVE_ACTIVE true
ENV APP_NAME "notifications-api"
ENV SERVICE_PORT 80
ENV START_CMD /tmp/startProcess.sh
ENV CERT_PATH /etc/nginx/conf.d/certs/localhost.crt
ENV KEY_PATH /etc/nginx/conf.d/certs/localhost.key

ENTRYPOINT [ "bash", "/tmp/pre-start.sh" ]