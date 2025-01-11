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

RUN groupadd -g 1001 sophon && \
    useradd -u 1001 -g sophon -m -s /bin/bash sophon

WORKDIR /app

RUN echo "${BUILD_TYPE}" > environment

COPY --from=builder /app/target/release/generate_node_id /app/
COPY --from=builder /app/target/release/sophon-node /app/

RUN chown -R sophon:sophon /app && \
    chmod -R 775 /app && \
    chmod +x /app/sophon-node /app/generate_node_id


COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
