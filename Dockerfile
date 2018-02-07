ARG BASE_IMAGE_TAG

FROM wodby/apache:${BASE_IMAGE_TAG}

ENV FILES_DIR="/mnt/files"

USER root

RUN set -ex; \
    \
    addgroup -S -g 82 www-data; \
    adduser -u 82 -D -S -s /bin/bash -G www-data www-data; \
    adduser apache www-data; \
    \
    mkdir -p "${FILES_DIR}"; \
    chown -R www-data:www-data /usr/local/apache2; \
    \
    # Script to fix volumes permissions via sudo.
    echo "chown www-data:www-data ${HTML_DIR} ${FILES_DIR}" > /usr/local/bin/fix-volumes-permissions.sh; \
    chmod +x /usr/local/bin/fix-volumes-permissions.sh; \
    \
    # Configure sudoers
    { \
        echo -n 'www-data ALL=(root) NOPASSWD: '; \
        echo -n '/usr/local/bin/fix-volumes-permissions.sh, ' ; \
        echo '/usr/local/apache2/bin/httpd'; \
    } | tee /etc/sudoers.d/www-data; \
    rm /etc/sudoers.d/apache

USER www-data

COPY templates /etc/gotpl/