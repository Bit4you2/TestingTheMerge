FROM golang:1.17-alpine as builder
RUN apk add --no-cache gcc musl-dev linux-headers git make
RUN git clone -b merge-kiln-v2 https://github.com/MariusVanDerWijden/go-ethereum.git
RUN cd go-ethereum && export PATH=$PATH:/usr/local/go/bin && make geth
RUN cd ..
RUN apk add --no-cache bash
#CMD bash

FROM alpine:latest
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache bash curl coreutils git
COPY --from=builder /go/go-ethereum/build/bin/geth /usr/local/bin/
RUN cd /root && git clone https://github.com/eth-clients/merge-testnets.git
EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]
