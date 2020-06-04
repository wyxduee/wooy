XX = g++
AR = ar
ARFLAG = -rcs
CFLAGS = -g

#CLIBS = -L./lib/ -lSender -lReceiver -lResponser  -lpthread
CLIBS =
SUBDIRS = ./src
INCLUDES = $(wildcard ./include/*.hpp)
SOURCES = $(wildcard ./*.cc /src/*.cc)
INCLUDE_DIRS = -I./include
TARGET = wooy
OBJECTS = $(patsubst %.cc,%.o,$(SOURCES))
export XX CFLAGS AR ARFLAG
$(TARGET) : $(OBJECTS) $(SUBDIRS)
	$(XX) $< -o $@ $(CLIBS)
$(OBJECTS) : %.o : %.cc
	$(XX) -c $(CFLAGS) $< -o $@ $(INCLUDE_DIRS)
$(SUBDIRS):ECHO
	+$(MAKE) -C $@
ECHO:
	@echo $(SUBDIRS)
	@echo begin compile
.PHONY:clean
clean:
	for dir in $(SUBDIRS);\
	do $(MAKE) -C $$dir clean||exit 1;\
	done
	rm -rf $(TARGET) $(OBJECTS)  ./lib/*.a
