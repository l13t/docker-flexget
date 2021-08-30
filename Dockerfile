ARG PYTHON_VERSION=3.9.6
FROM python:${PYTHON_VERSION}

ARG FLEXGET_VERSION=3.1.135

RUN pip install -U pip && \
    pip install FlexGet==$FLEXGET_VERSION && \
    groupadd -g 900 -r flexget && \
    useradd -m -u 900 -d /flexget -s $(which nologin) -g flexget flexget && \
    mkdir -p /flexget/.flexget

USER flexget

ENTRYPOINT [ "flexget", "daemon", "start" ]
