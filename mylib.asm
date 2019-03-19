[bits 32]

global foo
extern _printf

%include "macro_osx.mac"

foo:

    clib_prolog 16
    ; Call 'printf': printf( hello );
    mov     dword[ esp ],       hello
    call    _printf
    clib_epilog 16

    ret

hello: db "Hello!!", 10, 0
