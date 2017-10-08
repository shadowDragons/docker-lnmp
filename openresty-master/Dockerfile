FROM openresty/openresty

RUN  mkdir usr/local/openresty/nginx/conf/conf.d && mkdir -p /opt/htdocs && mkdir -p /opt/log/nginx

ADD  nginx.conf /usr/local/openresty/nginx/conf/
ADD  conf.d/* /usr/local/openresty/nginx/conf/conf.d/
VOLUME ["/opt"]
EXPOSE 80