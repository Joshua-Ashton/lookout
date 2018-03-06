FROM alpine:latest
RUN apk add --no-cache python python-dev linux-headers gcc musl-dev && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

COPY ./static /lookout/static
COPY ./lookout.py /lookout/lookout.py
COPY ./lookout.spec /lookout/lookout.spec
COPY ./requirements.txt /lookout/requirements.txt

RUN pip install -r /lookout/requirements.txt

RUN rm /lookout/requirements.txt

ENTRYPOINT python /lookout/lookout.py