FROM --platform=linux/amd64 python:3.8-slim-buster
# Python settings: Force unbuffered stdout and stderr (i.e. they are flushed to terminal immediately)
ENV PYTHONUNBUFFERED 1
# Python settings: do not write pyc files
ENV PYTHONDONTWRITEBYTECODE 1
ENV SLEEP_DURATION 5s
COPY script.sh .
COPY functions.sh .
COPY log-functions.sh .
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
       bzip2 \
       xz-utils \
       zlib1g \
       libxml2-dev \
       libxslt1-dev \
       libgomp1 \
       libsqlite3-0 \
       libgcrypt20 \
       libpopt0 \
       libzstd1 \
       jq \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && pip install scancode-toolkit
ENV ACTIVITY_SUB_TASK_CODE SCANCODE_EXECUTE
ENV OUTPUT_ARG scancode.html
ENV FORMAT_ARG --yaml
ENTRYPOINT ["./script.sh"]
