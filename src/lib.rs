#![no_std]
#![feature(panic_implementation)]

extern "C" {
	fn printk(fmt: *const u8);
}

#[no_mangle]
pub unsafe extern "C" fn rs_module_init() -> i64 {
	printk("Hello, kernel!\n\0".as_ptr());
	return 0;
}

#[no_mangle]
pub unsafe extern "C" fn rs_module_exit() {
	printk("Goodbye, kernel!\n\0".as_ptr());
}

#[panic_implementation]
#[no_mangle]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
	loop {}
}
