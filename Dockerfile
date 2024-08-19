FROM alpine:latest

RUN echo "Hello wold" > hello.txt
RUN cat hello.txt

ENTRYPOINT sleep 30

