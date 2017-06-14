FROM node:boron

MAINTAINER Kichink

RUN apt-get update \
    && npm install -g bower grunt-cli \
    && echo '{ "allow_root": true }' > /root/.bowerrc \
    && apt-get install -y ruby-full \
    && gem update --system \
    && gem install compass \
    && npm install gulp-cli -g \
    && npm install -g node-sass
RUN apt-get -y install build-essential
# Define working directory.
WORKDIR /data
