FROM postgres:9.6 

ENV CONFIG_ROOT /docker-entrypoint-initdb.d
RUN mkdir $CONFIG_ROOT

COPY config/init-devshop-db.sh $CONFIG_ROOT
COPY config/init-shop-db.sh $CONFIG_ROOT
