FROM python:3.11-rc-alpine

LABEL version="1.0"
LABEL description="Custom Docker Image with Python + weather reporting script - upon running the container, please pass the environment variables as command line arguments with -e"

COPY getweather ~/

RUN pip install pyowm

CMD ["python", "~/getweather"]
