FROM python:3.8
# Python settings: Force unbuffered stdout and stderr (i.e. they are flushed to terminal immediately)
ENV PYTHONUNBUFFERED 1
# Python settings: do not write pyc files
ENV PYTHONDONTWRITEBYTECODE 1
ENV SLEEP_DURATION 5s
COPY script.sh .
COPY functions.sh .
COPY log-functions.sh .
RUN apt-get update \

ENTRYPOINT ["echo" , "hi"]
