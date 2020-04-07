FROM golang:1.14-alpine AS build

# Install git
RUN apk add --no-cache git mercurial

WORKDIR /bot
COPY . .
RUN go get -v && go build

CMD [ "/bot/bot" ]