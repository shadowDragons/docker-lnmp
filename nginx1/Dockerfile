FROM nginx:1.9

ADD  nginx.conf /etc/nginx/nginx.conf
ADD  conf.d/* /etc/nginx/conf.d/
RUN  mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx

VOLUME ["/opt"]
EXPOSE 8001
