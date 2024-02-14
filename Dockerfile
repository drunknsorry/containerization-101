# This is a multi stage build dockerfile. It's currently configured to do a single
# stage build. To perform a multi part build comment lines 17 - 19 and
# uncomment lines 21 - 29.


FROM golang:1.22 AS hello-world-stage1

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /hello-world

EXPOSE 4000 

CMD ["/hello-world"]

# FROM alpine:latest AS hello-world-stage2

# WORKDIR /

# COPY --from=hello-world-stage1 /hello-world /hello-world

# EXPOSE 4000

# CMD ["/hello-world"]