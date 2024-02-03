#!/bin/sh
docker build -t arduino-nano-33-ble-builder .
docker run -t -v $(pwd):/app arduino-nano-33-ble-builder -- "cargo build --target thumbv7em-none-eabihf --release"
docker run -t -v $(pwd):/app arduino-nano-33-ble-builder -- "arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/rust-arduino-nano-33-blink target/blink.bin"
docker run --device /dev/ttyACM0 -t -v $(pwd):/app arduino-nano-33-ble-builder -- "arduino-cli upload -v -b arduino:mbed_nano:nano33ble -p /dev/ttyACM0 -i target/blink.bin"
