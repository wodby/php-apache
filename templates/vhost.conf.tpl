<VirtualHost *:80>
    DocumentRoot {{ getenv "APACHE_SERVER_ROOT" "/var/www/html" }}
    ServerName {{ getenv "APACHE_SERVER_NAME" "default" }}
    DirectoryIndex {{ getenv "APACHE_DIRECTORY_INDEX" "index.php" }}

    <Directory {{ getenv "APACHE_SERVER_ROOT" "/var/www/html" }}>
      Options Indexes FollowSymLinks
      AllowOverride All
      Require all granted
    </Directory>

    <Location />
      Require all granted
    </Location>

    <Proxy "fcgi://{{ getenv "APACHE_BACKEND_HOST" "php" }}:{{ getenv "APACHE_BACKEND_PORT" "9000" }}/">
        ProxySet connectiontimeout={{ getenv "APACHE_FCGI_PROXY_CONN_TIMEOUT" "5" }} timeout={{ getenv "APACHE_FCGI_PROXY_TIMEOUT" "60" }}
    </Proxy>
    <FilesMatch "\.php$">
        <If "-f %{REQUEST_FILENAME}">
            SetHandler "proxy:fcgi://{{ getenv "APACHE_BACKEND_HOST" "php" }}:{{ getenv "APACHE_BACKEND_PORT" "9000" }}"
        </If>
    </FilesMatch>
    {{ if getenv "APACHE_HTTP2" }}
    Protocols h2c http/1.1
    {{ end }}
    Include conf/healthz.conf
</VirtualHost>
