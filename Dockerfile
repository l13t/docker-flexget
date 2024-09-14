ARG PYTHON_VERSION=3.12.6
#FROM python:${PYTHON_VERSION}-alpine
FROM python:${PYTHON_VERSION}

ARG FLEXGET_VERSION

RUN pip install -U pip && \
    pip install FlexGet==${FLEXGET_VERSION} && \
    groupadd -g 1001 -r flexget && \
    useradd -m -u 1001 -d /flexget -s $(which nologin) -g flexget flexget && \
    mkdir -p /flexget/.flexget && \
    chown -R 1001:1001 /flexget

COPY init.sh /init.sh
RUN chmod +x /init.sh

USER flexget

WORKDIR /flexget

ENTRYPOINT [ "/init.sh" ]
