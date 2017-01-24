FROM node:boron

MAINTAINER Kichink

RUN apt-get update \
    && npm install -g bower grunt-cli \
    && echo '{ "allow_root": true }' > /root/.bowerrc \
    && apt-get install -y ruby-full \
    && gem update --system \
    && gem install compass \
    && npm install gulp-cli -g

# Define working directory.
WORKDIR /data
CMD ['bash']
