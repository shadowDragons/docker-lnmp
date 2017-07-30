FROM openresty/openresty

RUN  mkdir usr/local/openresty/nginx/conf/conf.d && mkdir /opt && mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx

ADD  nginx.conf /usr/local/openresty/nginx/conf/
ADD  conf.d/* /usr/local/openresty/nginx/conf/conf.d/
VOLUME ["/opt"]
EXPOSE 8001