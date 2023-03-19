let mcu_str = "Which MCU to target?";
let core_str = "Build core? (unstable)";

switch variable::get("arch") {
    "Cortex-M" => {
        variable::set("mcu", variable::prompt(mcu_str, "Cortex-M0", ["Cortex-M0", "Cortex-M0+", "Cortex-M1", "Cortex-M3", "Cortex-M4", "Cortex-M7", "Cortex-M23", "Cortex-M33", "Cortex-M35P"]));
        variable::set("build_core", variable::prompt(core_str, false));
    },
    "Xtensa" => {
        variable::set("mcu", variable::prompt(mcu_str, "esp32", ["esp32", "esp32s2", "esp32s3", "esp8266"]));
        variable::set("build_core", true);
    },
    _ => {
        variable::set("build_core", variable::prompt(core_str, false));
    },
}; 

let targets = #{
    esp32: #{
        rust_target: "xtensa-esp32-none-elf",
        runner: "espflash flash --monitor",
    },
    esp32s2: #{
        rust_target: "xtensa-esp32s2-none-elf",
        runner: "espflash flash --monitor",
    },
    esp32s3: #{
        rust_target: "xtensa-esp32s3-none-elf",
        runner: "espflash flash --monitor",
    },
    esp8266: #{
        rust_target: "xtensa-esp8266-none-elf",
        runner: "espflash flash --monitor",
    },
    "Cortex-M0": #{
        rust_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M0",
    },
    "Cortex-M0+": #{
        rust_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M0+",
    },
    "Cortex-M1": #{
        rust_target: "thumbv6m-none-eabi",
        runner: "probe-run --chip Cortex-M1",
    },
    "Cortex-M3": #{
        rust_target: "thumbv7m-none-eabi",
        runner: "probe-run --chip Cortex-M3",
    },
    "Cortex-M4": #{
        rust_target: "thumbv7em-none-eabi",
        runner: "probe-run --chip Cortex-M4",
    },
    "Cortex-M7": #{
        rust_target: "thumbv7em-none-eabi",
        runner: "probe-run --chip Cortex-M7",
    },
    "Cortex-M23": #{
        rust_target: "thumbv8m.base-none-eabi",
        runner: "probe-run --chip Cortex-M23",
    },
    "Cortex-M33": #{
        rust_target: "thumbv8m.main-none-eabi",
        runner: "probe-run --chip Cortex-M33",
    },
    "Cortex-M35P": #{
        rust_target: "thumbv8m.main-none-eabi",
        runner: "probe-run --chip Cortex-M35P",
    },
};

let target = variable::get("mcu");
let target_properties = targets.get(target);
for key in target_properties.keys() {
    variable::set(key, target_properties.get(key));
    debug(variable::get(key));
}
