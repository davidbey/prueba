FROM ubuntu:16.04
MAINTAINER david.bey@altia.es

#RUN apt-get update && \
#  apt-get -y install apache2

RUN \ 
  apt-get -y update && \
  apt-get -y install apache2 php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-gd php7.0-curl && \
  a2enmod rewrite headers && \
  rm -rf /var/lib/apt/lists/* && \
  update-rc.d apache2 disable && \
  sed -i -E 's,(ErrorLog ).+,\1\/dev\/stderr,g' /etc/apache2/sites-available/000-default.conf && \
  sed -i -E 's,(CustomLog ).+,\1\/dev\/stdout combined,g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD [ "/usr/sbin/apachectl",  "-f",  "/etc/apache2/apache2.conf", "-D", "FOREGROUND" ] 
