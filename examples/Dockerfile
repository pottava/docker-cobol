FROM debian:wheezy-slim

ADD . /usr/local/src/

RUN cd /usr/local/bin \
    && apt-get update && apt-get autoremove -y \
    && apt-get install -y build-essential open-cobol \

    # Build
    && cobc -x /usr/local/src/batch.cbl \

    # Clean up
    && apt-get purge -y --auto-remove build-essential \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /app
VOLUME /app

ENV APP_VERSION=0.1.0 \
    APP_TARGET=admin

ENTRYPOINT ["/usr/local/bin/batch"]
CMD ["ARG1", "ARG2"]
