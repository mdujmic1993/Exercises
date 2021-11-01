FROM python:3.11-rc-alpine

LABEL version="1.0"
LABEL description="Custom Docker Image with Python + scanner script"

COPY scanner ~/

RUN apk add nmap --no-cache && rm -f /var/cache/apk/*

ENTRYPOINT ["python", "~/scanner"]
