
default: Makefile build build_ci build/macros-arithmetique.a build/macros-arithmetique.exe run 




SHELL:= /bin/sh
.SHELLFLAGS: -u -e  
#MAKEFLAGS:= rR -j1 --warn-undefined-variables --warn-undefined-variables 
#MAKEFLAGS:= rR -j1 
.SUFFIXES: 
#.SILENT:
.NOTPARALLEL:
.EXPORT_ALL_VARIABLES:
.SECONDARY:
.PRECIOUS:
.ONESHELL:




clean:
	rm -Rf build 2>&1

clean-all: clean
	rm -Rf destroot run rundir *~ .*~ src/*~ src/*.output src/chaman.anime.ci COPYING_at_start_of_c_files   2>&1


Makefile: Makefile-gen.mkf
	@echo "--- \"Makefile-gen.mkf\" changed. Please type './configure' (or 'romake -f Makefile-gen.mkf') to update this Makefile ---"
	@false

build:
	mkdir -p build 2>&1 


install: destroot_do

destroot_do:
	rm -Rf destroot
	mkdir -p destroot
	mkdir -p destroot/bin
	cp -fp build/*.exe destroot/bin/calc-decimal
	mkdir -p destroot/lib
	cp -fp build/calc.a destroot/lib/decimal.a
	mkdir -p destroot/include
	cp -fp src/decimal.h destroot/include/








run: build/macros-arithmetique.exe
	rm -f run
	ln -s build/macros-arithmetique.exe run


build/macros-arithmetique.exe: build/macros-arithmetique.a build/main.o 
	x86_64-unknown-openbsd7.0-gcc-11.2.0 -o build/macros-arithmetique.exe build/main.o build/macros-arithmetique.a -lm      2>&1


build/macros-arithmetique.a: 
	ar -r -c build/macros-arithmetique.a  2>&1
	ranlib build/macros-arithmetique.a 2>&1






src/chaman.anime.ci: src/chaman.anime
	cat src/chaman.anime | ./tools/bin/text2cstring > src/chaman.anime.ci 

















build_ci: build  




build/main.c: src/main.c 
	ln src/main.c build/main.c 









build/main.o: build/main.c   
	x86_64-unknown-openbsd7.0-gcc-11.2.0 -std=c99 -D_THREAD_SAFE -D_REENTRANT -D __DEBUG__ -D DEBUG -O0  -fmessage-length=0 -fdiagnostics-show-location=once -fdiagnostics-show-option -fstack-check  -fverbose-asm -ffreestanding -feliminate-unused-debug-types  -Wall -W -Wextra  -Werror -Wfatal-errors  -Werror-implicit-function-declaration -Wparentheses -Wimplicit -Wreturn-type -Wcomment -Wpointer-arith -Wchar-subscripts -Wimplicit-int -Werror-implicit-function-declaration -Wmain -Wmissing-braces -Wmultichar -Wsequence-point -Wreturn-type -Wstrict-prototypes -Wpacked -Wcast-qual -Winline -Wformat-nonliteral -Wwrite-strings -Wmissing-field-initializers -Wsign-compare  -Wformat-zero-length -Wswitch -Wswitch-enum -Wswitch-default -Wnested-externs -Wunknown-pragmas    -g3  -fno-early-inlining -fno-gcse-lm -fno-move-loop-invariants -fno-peephole  -fno-sched-interblock -fno-sched-spec -fno-split-ivs-in-unroller -fno-toplevel-reorder -fno-tree-loop-optimize -fno-tree-vect-loop-version -fno-tree-loop-im -fno-tree-loop-ivcanon  -fno-stack-check -Wno-error -Wno-enum-compare       -fno-exceptions -fno-omit-frame-pointer  -fno-builtin -fno-builtin-printf -fno-builtin-abs -fno-builtin-strcpy -fno-builtin-strcat -fno-builtin-strlen -fno-builtin-bzero -fno-builtin-memset -fno-builtin-memcpy -fno-builtin-assert -fno-builtin-tolower -fno-builtin-toupper -fno-builtin-log -fno-builtin-alloca -fno-common -fno-exceptions -fno-non-call-exceptions -fno-asynchronous-unwind-tables -fno-inline -fno-inline-functions -fno-inline-functions  -Wno-cast-align -Wno-system-headers  -Wno-undef -Wno-redundant-decls -Wno-unused -Wno-unused-parameter -Wno-unused-function -Wno-switch-default -Wno-format-nonliteral    -c build/main.c -o build/main.o  2>&1















