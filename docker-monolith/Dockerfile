FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y mongodb ruby-full ruby-bundler build-essential git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone -b monolith https://github.com/express42/reddit.git

COPY mongodb.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh
RUN chmod 777 /start.sh

RUN cd /reddit && rm Gemfile.lock && bundle

CMD ["/start.sh"]
