FROM alpine

RUN apk update && apk upgrade

RUN apk add python3 python3-dev musl-dev libffi-dev gcc openssl-dev git

RUN pip3 install --no-cache --upgrade pip setuptools wheel

RUN pip3 install git+https://github.com/extinctpotato/mqtt-telegram-bridge

RUN apk del python3-dev musl-dev libffi-dev gcc openssl-dev git

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
