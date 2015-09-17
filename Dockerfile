FROM dockerfile/nodejs
MAINTAINER Ainsley Chong <ainsley.chong@gmail.com>
RUN adduser --disabled-password --gecos "" sinopia
RUN mkdir -p /opt/sinopia/storage
WORKDIR /opt/sinopia
RUN npm install js-yaml sinopia
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
ADD /config_gen.js /opt/sinopia/config_gen.js
ADD /start.sh /opt/sinopia/start.sh
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
VOLUME /opt/sinopia
