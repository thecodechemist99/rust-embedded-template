let targets = #{
    esp32: #{
        rust_target: "xtensa-esp32-none-elf",
        build_core: true,
        runner: "espflash flash --monitor",
    },
    esp32s2: #{
        rust_target: "xtensa-esp32s2-none-elf",
        build_core: true,
        runner: "espflash flash --monitor",
    },
    esp32s3: #{
        rust_target: "xtensa-esp32s3-none-elf",
        build_core: true,
        runner: "espflash flash --monitor",
    },
    esp8266: #{
        rust_target: "xtensa-esp8266-none-elf",
        build_core: true,
        runner: "espflash flash --monitor",
    },
    "Cortex-M0": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M0",
    },
    "Cortex-M0+": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M0+",
    },
    "Cortex-M1": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M1",
    },
    "Cortex-M3": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv7m-none-eabi",
        runner: "probe-run --chip Cortex-M3",
    },
    "Cortex-M4": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv7em-none-eabi",
        runner: "probe-run --chip Cortex-M4",
    },
    "Cortex-M7": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv7em-none-eabi",
        runner: "probe-run --chip Cortex-M7",
    },
    "Cortex-M23": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv8m.base-none-eabi",
        runner: "probe-run --chip Cortex-M23",
    },
    "Cortex-M33": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv8m.main-none-eabi",
        runner: "probe-run --chip Cortex-M33",
    },
    "Cortex-M35P": #{
        rust_target: "'cfg(all(target_arch = "arm", target_os = "none"))'",
        build_target: "thumbv8m.main-none-eabi",
        runner: "probe-run --chip Cortex-M35P",
    },
};

let target = variable::get("mcu");
let target_properties = targets.get(target);
for key in target_properties.keys() {
    variable::set(key, target_properties.get(key));
}