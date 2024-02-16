FROM aquasec/trivy:0.48.3

RUN apk add --no-cache --upgrade bash && \
    apk add jq

WORKDIR /app

COPY . .

ENV SCAN_TYPE ""
ENV SCAN_SEVERITY "HIGH,CRITICAL"
ENV FORMAT_ARG "table"
ENV OUTPUT_ARG "trivy-report.json"
ENTRYPOINT [ "./build.sh" ]
