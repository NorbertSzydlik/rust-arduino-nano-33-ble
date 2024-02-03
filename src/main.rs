#![no_main]
#![no_std]

use embedded_hal::prelude::_embedded_hal_timer_CountDown;

use nb::block;
use embedded_hal::digital::v2::OutputPin;
use nrf52840_hal as hal;
use hal::gpio::Level;

#[panic_handler] // panicking behavior
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {
        cortex_m::asm::bkpt();
    }
}

#[cortex_m_rt::entry]
fn main() -> ! {
    let p = hal::pac::Peripherals::take().unwrap();
    let port0 = hal::gpio::p0::Parts::new(p.P0);
    let mut led = port0.p0_13.into_push_pull_output(Level::Low);

    let mut timer = hal::timer::Timer::new(p.TIMER0);

    loop {
        led.set_high().unwrap();
        timer.start(5_000_000u32);
        let _ = block!(timer.wait());
        led.set_low().unwrap();
        timer.start(1_000_000u32);
        let _ = block!(timer.wait());
    }
}
