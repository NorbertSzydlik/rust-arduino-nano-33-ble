# Rust on Arduino nano 33 BLE
This package is minimal example how to run program written in Rust on Arduino Nano 33 BLE.
It uses Nordic nRF52480 processor, but it has different interface to flash new software than examples from `nrf-hal`.

# Compile and flash program to the device
To flash this example package, simply run `./build.sh`.
You may need to change path to device from `/dev/ttyACM0` to something different in `build.sh` file.

## Compile and flash without docker
Using Docker is not strictly necessary and it exists to document what dependecies need to be installed on the system to use this example.
You can compile and flash it yourself using following commands:
* `cargo build --target thumbv7em-none-eabihf --release`
* `arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/rust-arduino-nano-33-blink target/blink.bin`
* `arduino-cli upload -v -b arduino:mbed_nano:nano33ble -p /dev/ttyACM0 -i target/blink.bin`
