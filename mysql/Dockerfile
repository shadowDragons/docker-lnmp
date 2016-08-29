FROM hub.c.163.com/library/mysql:5.7

# this need to stay the same for script to work
ENV MYSQL_USER mysql

COPY ./localdb-run.sh /
RUN chmod 755 /localdb-run.sh

ENTRYPOINT ["/localdb-run.sh"] 

