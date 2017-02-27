# OpenCOBOL v1.1
# docker run --rm -it pottava/cobol

FROM debian:wheezy-slim

ENV COBOL_VERSION=1.1-1

RUN apt-get update && apt-get autoremove -y \
    && apt-get install -y build-essential "open-cobol=${COBOL_VERSION}" \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["/usr/bin/cobc", "--help"]
