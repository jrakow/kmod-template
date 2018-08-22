.PHONY: clean default target
default: {{crate_name}}.ko

target:
	cargo +nightly xbuild --target x86_64-linux-kernel-module

obj-m := {{crate_name}}.o
{{crate_name}}-objs := init_exit.o target/x86_64-linux-kernel-module/debug/lib{{crate_name}}.a

{{crate_name}}.ko: target
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(CURDIR) modules

clean:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(CURDIR) clean
	cargo clean

.PHONY: insmod rmmod
insmod: {{crate_name}}.ko
	sudo insmod {{crate_name}}.ko

rmmod:
	sudo rmmod {{crate_name}}.ko
