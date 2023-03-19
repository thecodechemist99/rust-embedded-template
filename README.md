# Generic embedded Rust project template
This is a basic starting point for embedded rust applications.

## Toolchain Setup
Depending on your target platform, you might need to set up the required toolchain first. How to do this is not covered here.

## Create your Project
You can create a project from this template with `cargo-generate`:
```
# if not yet installed
cargo install cargo-generate

# create from template
cargo generate --git https://github.com/thecodechemist99/rust-embedded-template
```

## Sources
This project is partially based upon:
- https://github.com/esp-rs/esp-template
- https://github.com/thecodechemist99/esp8266-rust
