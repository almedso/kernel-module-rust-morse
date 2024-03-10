# SPDX-License-Identifier: GPL-2.0

# define kernel source with reference to the local kernel if not passed along
KERNEL_SRC ?= /lib/modules/`uname -r`/build

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install: default
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	$(RM) -f *.cmd *.order* *.symvers* *.mod* *.ko* *.o* .*.cmd .*.d
	$(RM) -rf .tmp_versions Modules.symvers
