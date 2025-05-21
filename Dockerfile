FROM alpine:latest
MAINTAINER "Bayesia-SAS'
COPY app/requirements.txt .
RUN apk update && apk add python3 py3-pip --no-cache && pip install gunicorn --no-cache-dir --break-system-packages && pip install --requirement requirements.txt --no-cache-dir --break-system-packages && mkdir -p /opt/imgs/uploads
ADD app/ /opt/imgs
WORKDIR /opt/imgs
EXPOSE 5000
CMD gunicorn imgs:app --bind :5000
