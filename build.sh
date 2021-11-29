#!/bin/sh

rm -Rf build 2>&1

mkdir -p build 2>&1











ar -r -c build/macros-arithmetique.a  2>&1
ranlib build/macros-arithmetique.a 2>&1
/usr/bin/cc -o build/macros-arithmetique.exe build/macros-arithmetique.a     2>&1

rm -f run
ln -s build/macros-arithmetique.exe run
chmod +x run

