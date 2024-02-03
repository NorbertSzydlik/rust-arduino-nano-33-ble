FROM ubuntu:22.04
# install Ubuntu packages
RUN apt-get update && apt-get install -y build-essential curl gcc-arm-none-eabi
# install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN echo 'source /root/.cargo/env' >> $HOME/.bashrc
RUN rustup target add thumbv7em-none-eabihf
# install arduino-cli. Mostly used for it's bossac to upload binary
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh
RUN arduino-cli core install arduino:mbed_nano
WORKDIR /app
# give possiblity to run commands in isolation
ENTRYPOINT [ "/bin/bash", "-c"]
