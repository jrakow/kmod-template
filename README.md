# {{project-name}}: A Linux kernel module written in Rust

## Prerequisites
- Make and a C compiler
- [`cargo-xbuild`](https://github.com/rust-osdev/cargo-xbuild) and Rust standard library sources:
    ```
    rustup component add --toolchain=nightly rust-src
    ```
- Kernel development files: `kernel-default-devel`
- A virtual machine.
    Kernel modules can crash your system completely.

## Project Generation
<!-- TODO remove after generating -->
This project is generated from `kmod-template`, a template for [`cargo-generate`](https://github.com/ashleygwilliams/cargo-generate).
After installing `cargo-generate`, which requires `libcurl-devel`, `libopenssl-devel`, `libgit2-devel` and CMake, execute the following to generate a kernel module project:
```
cargo generate --git https://github.com/jrakow/kmod-template.git
```

## Building
The build tool used is Make, which invokes Cargo for you.
Build targets are:
- `target`: Build the crate as a static library in debug mode.
- `default`: Build `target`, a C shim and generate the kernel module `{{crate_name}}.ko`.
- `insmod`, `rmmod`: Insert or remove the built module into the kernel.
    This needs sudo.
- `clean`: Remove generated files.

## Example Usage
1. Build
    ```
    make
    ```
2. Load into the kernel
    ```
    make insmodd
    ```
3. Unload from the kernel
    ```
    make rmmod
    ```
4. Observe output with dmesg
    ```
    dmesg
    ```
    Dmesg should show some output at the end:
    ```
    [ 2757.937952] Hello, kernel!
    [ 2757.961635] Goodbye, kernel!
    ```

## License
This template is licensed under GPL2.

## Thanks
Thanks to [u/alex](https://github.com/alex), from whom the kernel compilation target is copied.
