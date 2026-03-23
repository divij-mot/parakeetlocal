FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir nvidia-riva-client

COPY transcribe /usr/local/bin/transcribe
RUN chmod +x /usr/local/bin/transcribe

WORKDIR /data

ENTRYPOINT ["transcribe"]
