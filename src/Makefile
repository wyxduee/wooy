LIB_DIR = ./../lib/
TOP_DIR = ./..

SOURCES = $(wildcard ./*.cc)
INCLUDE_DIRS = -I$(TOP_DIR)/include

#TARGET = libReceiver.a
OBJECTS = $(patsubst %.cc,%.o,$(SOURCES))

#$(TARGET) : $(OBJECTS)
#	$(AR) $(ARFLAG) $@ $^
#	cp $@ $(LIB_DIR)
$(OBJECTS) : %.o : %.cc
	$(XX) -c $(CFLAGS) $< -o $@ $(INCLUDE_DIRS)

.PHONY:clean
clean:
	rm -rf $(TARGET) $(OBJECTS)
