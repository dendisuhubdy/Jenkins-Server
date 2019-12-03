
FROM nginx:latest

RUN \
  apt-get update \
  && apt-get -y install apache2-utils runit \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY templates/all-services.tpl /tmp/all-services.tpl

COPY templates/nginx.conf.template /tmp/nginx.conf.template

RUN mkdir -p /etc/service/nginx && rm -rf /etc/service/nginx/*

ADD services/nginx.service /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run

ADD scripts/nginx-start.sh /
RUN chmod u+x /nginx-start.sh

CMD ["/nginx-start.sh"]
