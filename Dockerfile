FROM rust:1.59

ARG SOLANA_VERSION=v1.9.14
ARG ANCHOR_VERSION=v0.23.0

RUN apt-get update -y 
RUN apt-get upgrade -y 
RUN apt-get install -y pkg-config build-essential libudev-dev clang
RUN rustup component add rustfmt clippy

RUN sh -c "$(curl -sSfL https://release.solana.com/$SOLANA_VERSION/install)"
ENV PATH=/root/.local/share/solana/install/active_release/bin:$PATH

RUN cargo install --git https://github.com/project-serum/anchor --tag $ANCHOR_VERSION anchor-cli --locked

COPY shell-exec.sh /bin/shell-exec
RUN chmod +x /bin/shell-exec

WORKDIR workspace/