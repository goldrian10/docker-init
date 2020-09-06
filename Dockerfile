FROM alpine
RUN apk add build-base
COPY . /usr/ie0217
WORKDIR /usr/ie0217
RUN mkdir bin
RUN g++ -o bin/main src/main.cpp
CMD ["./bin/main"]
