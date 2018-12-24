FROM python:3

RUN pip install youtube-dl

WORKDIR /youtube-dl

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
