FROM mysql:5.7.22
RUN apt-get update && apt-get install -y cron
ADD crontab.conf /crontab.conf
ADD script.sh /script.sh
COPY entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.conf
CMD ["/entry.sh"]