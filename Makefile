CC := gcc

INCLUDE_PATH := /usr/local/include
LIBRARY_PATH := /usr/local/lib

CFLAGS := -Wall -O2 -g -D_GNU_SOURCE -D_REENTRANT -I$(INCLUDE_PATH)
LDFLAGS := -pthread -L$(LIBRARY_PATH) -lnvmed

NVMED_INFO = nvmed_info
NVMED_INFO_OBJS = nvmed_info.o nvmed_info_identify.o nvmed_info_utils.o nvmed_info_features.o nvmed_info_logs.o nvmed_info_pci.o

default: $(NVMED_INFO)

$(NVMED_INFO): $(NVMED_INFO_OBJS)
	$(CC) $(CFLAGS) $(NVMED_INFO_OBJS) -o $(NVMED_INFO) $(LDFLAGS) 

install: $(NVMED_INFO)
	install -m 755 -o root -g root $(NVMED_INFO) /usr/local/bin/

clean:
	rm -f $(NVMED_INFO) *.o

clobber: clean

.PHONY: default clean clobber
