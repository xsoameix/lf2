#   Getting Started

Fork and download this repository by [these steps](https://help.github.com/articles/fork-a-repo).

Open the function you want to decompile, eg: `attack_process`

    cd lf2
    vim attack_process.rb

Push to github to contribute your work if you want.

#   x86 instructions

##  Float number comparison

    fcom source

*   ST(0) > source, C3: 0, C2: 0, C0: 0
*   ST(0) = source, C3: 1, C2: 0, C0: 0
*   ST(0) < source, C3: 0, C2: 0, C0: 1

Jump if ST(0) < source

    fcom source
    fstsw ax
    test ah,5 (C2 and C0)
    jpo short 0042EFB1

Jump if ST(0) <= source

    fcom source
    fstsw ax
    test ah,41 (C3 and C0)
    jnz short 0042F008

Jump if ST(0) > source

    fcom source
    fstsw ax
    test ah,41 (C3 and C0)
    je short 0042EFC6

or

    fcom source
    fstsw ax
    test ah,41 (C3 and C0)
    jpe short 0042F251

Jump if ST(0) >= source

    fcomp source
    fstsw ax
    test ah,5 (C2 and C0)
    jpe short 0042EE20

or

    fcom source
    fstsw ax
    test ah,1 (C0)
    je short 0042F248

##  Divide constant

x / y = x * (1 / y) = x * ((1 * 2^n) / (y * 2^n)) = x * (2^n / y) / 2^n

let c = (2^n / y)

    x / y = x * c / 2^n

if x >= 0

    [x / y] = ⌊x * c / 2^n⌋

if x < 0

    [x / y] = ⌈x * c / 2^n⌉ = ⌊x * c / 2^n⌋ + 1

example:

    # eax = c
    mov eax,66666667

    # ecx = x
    imul ecx

    # edx = x * c / 2^n
    # n = 32 (because it is edx) + 2 (in this example)
    sar edx,2

    mov eax,edx
    shr eax,1F
    # if x >= 0
    #   eax = 0
    # if x < 0
    #   eax = 1

    add eax,edx
    # if x >= 0
    #     [x / y] = ⌊x * c / 2^n⌋ + 0
    # if x < 0
    #     [x / y] = ⌊x * c / 2^n⌋ + 1

c = 2^n / y = 2^(32 + 2) / y = 66666667h
=> y = 2^(32 + 2) / 66666667h = 9.FFFFFF ≈ 10

so the solution is:

    x / 10
