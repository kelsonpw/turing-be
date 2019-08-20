FROM mysql:5.7

MAINTAINER Celestine Ekoh-Ordan <celestine.e@turing.com>

ENV MYSQL_DATABASE 'turing'
ENV MYSQL_ROOT_PASSWORD 'root'
ENV MYSQL_USER 'turing'
ENV MYSQL_PASSWORD 'turing'

COPY ./db/dump.sql /docker-entrypoint-initdb.d/dump.sql

# clone and build specific ruby version
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates curl bzip2 build-essential libssl-dev libreadline-dev zlib1g-dev libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/sstephenson/ruby-build/archive/v20190130.tar.gz | tar -zxvf - -C /tmp/ && \
    cd /tmp/ruby-build-* && ./install.sh && cd / && \
    ruby-build -v 2.6.1 /usr/local && rm -rfv /tmp/ruby-build-* && \
    gem install bundler

ENV APP_HOME /backend
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME
RUN bundle install

EXPOSE 80
EXPOSE 3306

COPY turing-entrypoint.sh /turing-entrypoint.sh

RUN ["chmod", "+x", "/turing-entrypoint.sh"]
ENTRYPOINT ["/turing-entrypoint.sh"]
