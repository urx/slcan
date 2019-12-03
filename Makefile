BINARY		= slcan
DEVICE          = STM32F105RCT6
OPENCM3_DIR     = ./libopencm3
OBJS            += slcan.o

CFLAGS          += -Os -ggdb3
CPPFLAGS	+= -MD
LDFLAGS         += -static -nostartfiles
LDLIBS          += -Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group

include $(OPENCM3_DIR)/mk/genlink-config.mk
include $(OPENCM3_DIR)/mk/gcc-config.mk

.PHONY: clean all

all: lib $(BINARY).elf $(BINARY).hex

lib:
	TARGETS=stm32/f1 make -C $(OPENCM3_DIR)

clean:
	$(Q)$(RM) -rf binary.* *.o $(BINARY).elf $(BINARY).hex

include $(OPENCM3_DIR)/mk/genlink-rules.mk
include $(OPENCM3_DIR)/mk/gcc-rules.mk
