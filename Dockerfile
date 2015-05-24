FROM index.alauda.cn/testbunker/docker-alpine
VOLUME /mnt/routes
EXPOSE 8000

ENV GOPATH /go
RUN apk-install go git mercurial
COPY . /go/src/github.com/gliderlabs/logspout
WORKDIR /go/src/github.com/gliderlabs/logspout
RUN go get && go build -ldflags "-X main.Version dev" -o /bin/logspout
ENTRYPOINT ["/bin/logspout"]
