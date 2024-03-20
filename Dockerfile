FROM golang:1.22.1-alpine3.19 as builder
RUN go install golang.org/x/tools/cmd/present@latest

FROM alpine:3.19
EXPOSE 3999
COPY --from=builder /go/bin/present /usr/local/bin/present
COPY images/* /root/present/images/
COPY examples/* /root/present/examples/
COPY *.slide /root/present/
WORKDIR /root/present
ENTRYPOINT ["/usr/local/bin/present", "-http=:3999"]
CMD ["-notes"]
