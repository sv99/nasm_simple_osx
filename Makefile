.PHONY: all clean

# warning ld supressed by -w
LDFLAGS=-arch i386 -lc -macosx_version_min 10.6 -w

SIMPLE_SOURCES=simple.asm
SIMPLE_OBJECTS=$(SIMPLE_SOURCES:.asm=.o)
SIMPLE_EXECUTABLE=simple

SHARED_SOURCES=shared.asm
SHARED_OBJECTS=$(SHARED_SOURCES:.asm=.o)
LIB_SOURCES=mylib.asm
LIB_OBJECTS=$(LIB_SOURCES:.asm=.o)
SHARED_LIB=libfoo
SHARED_EXECUTABLE=shared

all: $(SIMPLE_EXECUTABLE) $(SHARED_EXECUTABLE)

# $@ Имя цели обрабатываемого правила
$(SIMPLE_EXECUTABLE): $(SIMPLE_OBJECTS)
	ld $(LDFLAGS) $(SIMPLE_OBJECTS) -o $@

$(SHARED_LIB): $(LIB_OBJECTS)
	ar -cq $@.a $(LIB_OBJECTS)

$(SHARED_EXECUTABLE): $(SHARED_LIB) $(SHARED_OBJECTS)
	ld $(LDFLAGS) $(SHARED_OBJECTS) -L./ -lfoo -o $@

# $< Имя первой зависимости обрабатываемого правила
%.o: %.asm
	nasm -f macho $< -o $@

clean:
	rm -rf *.o *.dylib *.a $(SIMPLE_EXECUTABLE) $(SHARED_EXECUTABLE)
