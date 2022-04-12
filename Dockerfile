FROM nginx:alpine

COPY default.conf.template /etc/nginx/templates/default.conf.template

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN  chmod +x /docker-entrypoint.sh

ENV TARGET http://host.docker.internal:8087/
ENV ALLOW_ORIGIN ''
ENV COOKIE ''

ENTRYPOINT ["/docker-entrypoint.sh"]
