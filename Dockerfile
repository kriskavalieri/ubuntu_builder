FROM ubuntu:16.04
RUN apt update && apt install -y build-essential tcl curl
RUN cd /tmp && curl -O http://download.redis.io/releases/redis-3.2.11.tar.gz && tar xzvf redis-3.2.11.tar.gz && cd redis* && make && make install
RUN mkdir /etc/redis
ADD redis.conf /etc/redis/
RUN adduser --system --group --no-create-home redis
RUN mkdir /var/lib/redis   # create directory
RUN chown redis:redis /var/lib/redis   # make redis own /var/lib/redis
RUN chmod 770 /var/lib/redis   # adjust permission
