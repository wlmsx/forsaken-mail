FROM node:lts-alpine
MAINTAINER Aldrich J. Xing <x@ora.pub>

WORKDIR /forsaken-mail

RUN wget https://github.com/wlmsx/forsaken-mail/archive/master.tar.gz -q -O /tmp/forsaken-mail-master.tar.gz \
    && tar zxf /tmp/forsaken-mail-master.tar.gz -C /tmp \
    && mv /tmp/forsaken-mail-master/* /forsaken-mail \
    && rm /tmp/forsaken-mail-master.tar.gz \
    && npm install --production \
    && npm cache clean --force

EXPOSE 25
EXPOSE 3000
CMD ["npm", "start"]
