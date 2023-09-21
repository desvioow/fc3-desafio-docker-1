FROM golang as builder-image

WORKDIR /go/project

ADD hello.go hello.go
RUN go mod init project
RUN go build


FROM scratch

WORKDIR /go
COPY --from=builder-image /go/project .

ENTRYPOINT ["./project"]
