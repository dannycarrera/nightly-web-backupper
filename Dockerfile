FROM alpine:3.6

RUN set -ex && apk --no-cache add sudo
ADD crontab.txt /crontab.txt
ADD script.sh /script.sh
COPY entry.sh /entry.sh
RUN chmod 755 /script.sh /entry.sh

CMD ["/entry.sh"]