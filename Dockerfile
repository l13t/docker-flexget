ARG PYTHON_VERSION=3.9.6
FROM python:${PYTHON_VERSION}

ARG FLEXGET_VERSION=3.1.135

RUN pip install -U pip && \
    pip install FlexGet==$FLEXGET_VERSION && \
    groupadd -g 1001 -r flexget && \
    useradd -m -u 1001 -d /flexget -s $(which nologin) -g flexget flexget && \
    mkdir -p /flexget/.flexget && \
    chown -R 1001:1001 /flexget

USER flexget

WORKDIR /flexget
