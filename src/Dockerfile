FROM rust:latest AS builder

RUN git clone https://github.com/sophon-org/sophon-light-node.git /app
RUN cd /app && cargo build --release

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        file \
        coreutils \
        bc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/target/release/sophon-node /app/
RUN chmod +x sophon-node

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/app/sophon-node ${OPERATOR_ADDRESS:+--operator $OPERATOR_ADDRESS} ${DESTINATION_ADDRESS:+--destination $DESTINATION_ADDRESS} ${PERCENTAGE:+--percentage $PERCENTAGE} ${IDENTITY:+--identity $IDENTITY} ${PUBLIC_DOMAIN:+--public-domain $PUBLIC_DOMAIN} ${MONITOR_URL:+--monitor-url $MONITOR_URL} ${NETWORK:+--network $NETWORK} ${AUTO_UPGRADE:+--auto-upgrade $AUTO_UPGRADE}"]
