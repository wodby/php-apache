# Apache for PHP-FPM Docker Container Image 

[![Build Status](https://travis-ci.org/wodby/php-apache.svg?branch=master)](https://travis-ci.org/wodby/php-apache)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/php-apache.svg)](https://hub.docker.com/r/wodby/php-apache)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/php-apache.svg)](https://hub.docker.com/r/wodby/php-apache)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/php-apache.svg)](https://microbadger.com/images/wodby/php-apache)

## Docker Images

!!! For better reliability we release images with stability tags (`wodby/php-apache:2.4-X.X.X`) which correspond to [git tags](https://github.com/wodby/php-apache/releases). We **STRONGLY RECOMMEND** using images only with stability tags. 

Overview:

* All images are based on Alpine Linux
* Base image: [wodby/apache](https://github.com/wodby/apache)
* [Travis CI builds](https://travis-ci.org/wodby/php-apache) 
* [Docker Hub](https://hub.docker.com/r/wodby/php-apache)

Supported tags and respective `Dockerfile` links:

* `2`, `2.4`, `latest` [_(Dockerfile)_](https://github.com/wodby/php-apache/tree/master/Dockerfile)

## Environment Variables

| Variable                         | Default Value   | Description |
| -------------------------------- | --------------- | ----------- |
| `APACHE_BACKEND_HOST`            | `php`           |             |
| `APACHE_BACKEND_PORT`            | `9000`          |             |
| `APACHE_FCGI_PROXY_CONN_TIMEOUT` | `5`             |             |
| `APACHE_FCGI_PROXY_TIMEOUT`      | `60`            |             |
| `APACHE_SERVER_NAME`             | `default`       |             |
| `APACHE_SERVER_ROOT`             | `/var/www/html` |             |

See [wodby/apache](https://github.com/wodby/apache) for all variables