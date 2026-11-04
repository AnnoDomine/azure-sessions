FROM python:3-slim

WORKDIR /

COPY . .

CMD [ "echo", "Hello World" ]