.PHONY: all clean

# warning ld supressed by -w
LDFLAGS=-arch i386 -lc -macosx_version_min 10.6 -w

SOURCES=main.asm
OBJECTS=$(SOURCES:.asm=.o)
EXECUTABLE=simple

all: $(SOURCES) $(EXECUTABLE)

# $@ Имя цели обрабатываемого правила
$(EXECUTABLE): $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o $@

# $< Имя первой зависимости обрабатываемого правила
%.o: %.asm
	nasm -f macho $< -o $@

clean:
	rm -rf *.o $(EXECUTABLE)
