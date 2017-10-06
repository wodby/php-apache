#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

sudo fix-permissions.sh www-data www-data "${WODBY_DIR_FILES}"

gotpl /etc/gotpl/php.conf.tpl > "${APACHE_DIR}/conf/conf.d/php.conf"