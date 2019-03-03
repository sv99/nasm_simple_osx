Compile nasm i386 on MAC
========================

[How to print argv0 in NASM?](https://stackoverflow.com/questions/12678230/how-to-print-argv0-in-nasm)

[x86 Assembly on a Mac](https://stackoverflow.com/questions/5649/x86-assembly-on-a-mac/357113#357113)

[Makefile для самых маленьких](https://habr.com/ru/post/155201/)

[Просто о make](https://habr.com/ru/post/211751/)

[NASM Documentation](https://nasm.us/doc/nasmdoc0.html)

    # Build with make
    make clean
    make
    ./simple

    # MAnual build
    nasm -f macho main.asm
    ld -arch i386 -lc -macosx_version_min 10.6 -w main.o -o simple


