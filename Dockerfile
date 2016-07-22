FROM golang:1.6
MAINTAINER Elliot Wright <elliot@elliotwright.co>

RUN \
  useradd -u 1000 -m -s /bin/bash satis && \
  mkdir -p /opt/satis && \
  chown -R satis: /go && \
  chown -R satis: /opt/satis && \
  chown -R satis: /usr/local/bin && \
  apt-get update && \
  apt-get install -y php5-cli php5-common && \
  apt-get autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER satis

RUN \
  go get github.com/benschw/satis-go && \
  cd /go/src/github.com/benschw/satis-go && \
  make satis-install && \
  make admin-ui && \
  make deps && \
  sed -i "/^bind:/c\bind\:\ 0\.0\.0\.0\:8080" ./config-local.yaml && \
  go build

EXPOSE 8080

VOLUME /go/src/github.com/benschw/satis-go/data
VOLUME /go/src/github.com/benschw/satis-go/config-local.yml

WORKDIR /go/src/github.com/benschw/satis-go

CMD ./satis-go -config config-local.yaml
