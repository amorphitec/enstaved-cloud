FROM python:3.5
ENV PYTHONUNBUFFERED 1

RUN \
  apt-get -y update && \
  apt-get install -y gettext && \
  apt-get clean

ENV APP_ROOT /app
ENV GIT_REPO https://github.com/amorphitec/enstaved-shop.git
ENV GIT_BRANCH enstaved-master

RUN mkdir $APP_ROOT
RUN git clone -b $GIT_BRANCH $GIT_REPO $APP_ROOT

RUN pip install -r /app/requirements.txt

CMD ["uwsgi", "/app/saleor/wsgi/uwsgi.ini"]
