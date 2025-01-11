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

RUN echo "${BUILD_TYPE}" > environment

COPY --from=builder /app/target/release/sophon-node /app/
RUN chmod +x sophon-node

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
