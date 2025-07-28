FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
# 调试网络用工具
    apt-get --no-install-recommends -y install iproute2 curl vim iputils-ping procps net-tools traceroute dnsutils \
    libgl1 libglib2.0-0 libxext6 libsm6 libxrender1 && \
    uv pip install --system -U flask waitress pypdf && \
    rm -rf /var/lib/apt/lists/*
COPY pdf2zh/ .
RUN uv pip install --system --no-cache . && babeldoc --version && babeldoc --warmup

#ADD "https://github.com/timelic/source-han-serif/releases/download/main/SourceHanSerifJP-Regular.ttf" /app/
COPY server.py /app/

EXPOSE 8888
CMD ["python", "server.py", "8888"]
