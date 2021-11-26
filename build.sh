#!/bin/sh

rm -Rf build 2>&1

mkdir -p build 2>&1











ar -r -c build/macros-arithmetique.a  2>&1
ranlib build/macros-arithmetique.a 2>&1
x86_64-unknown-openbsd7.0-gcc-11.2.0 -o build/macros-arithmetique.exe build/macros-arithmetique.a -lm      2>&1

rm -f run
ln -s build/macros-arithmetique.exe run
chmod +x run

