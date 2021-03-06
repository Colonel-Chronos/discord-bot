ARG VERSION
FROM golang:1.14-alpine AS dev

WORKDIR /bot

RUN GO111MODULE=on go get github.com/cortesi/modd/cmd/modd

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go install github.com/UCCNetsoc/discord-bot

CMD [ "go", "run", "*.go" ]

FROM alpine

WORKDIR /bin

ENV BOT_VERSION=${VERSION}

COPY --from=dev /go/bin/discord-bot ./discord-bot

EXPOSE 2112

CMD [ "discord-bot", "-p" ]
