FROM phusion/baseimage:0.9.16
MAINTAINER Greg Thompson

CMD ["/sbin/my_init"]

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git python build-essential wget screen tmux curl vim mongodb-org -y
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -y nodejs
RUN sudo service mongod start

RUN mkdir /data
RUN mkdir /data/db

#creating location for startup scripts, adding them and chmod them. 
RUN mkdir -p /etc/my_init.d
ADD _sys/init/ /etc/my_init.d/
RUN chmod -R 777 /etc/my_init.d/

#app dist/prod ready code location creation and binding
RUN mkdir -p /var/www
RUN chmod -R 644 /var/www
ADD /dist /var/www

#app dev code location creation. Binding is done with volumes in the run command
RUN mkdir /Development
RUN chmod 777 -R /Development

RUN npm install -g grunt-cli express forever

# CMD cd Development && npm install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# CMD npm install -g express-generator