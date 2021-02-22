FROM python:3.9.2-alpine3.13

COPY requirements.txt /requirements.txt

RUN /sbin/apk add --no-cache --virtual .deps git \
 && /usr/local/bin/pip install --no-cache-dir --requirement /requirements.txt \
 && /sbin/apk del --no-cache .deps

ENTRYPOINT ["/usr/local/bin/session_mirror_tap"]
