ARG APACHE_VER

FROM wodby/apache:${APACHE_VER}

ENV WODBY_DIR_FILES /mnt/files

USER root

RUN rm /etc/gotpl/vhost.conf.tpl && \
    mkdir -p $WODBY_DIR_FILES

USER www-data

COPY php.conf.tpl /etc/gotpl/
COPY init /docker-entrypoint-init.d/