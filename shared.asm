[bits 32]

section .text

global start
global foo2
extern _exit
extern foo

%include "macro_osx.mac"

start:

    clib_prolog 16
    call    foo
    clib_epilog 16

    clib_prolog 16
    call    _exit
