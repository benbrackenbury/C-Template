# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

SRCS := src/main.c
BINS := bin/main

all: bin/main

bin/main: bin/main.o
	gcc bin/main.o -o bin/main

bin/main.o: src/main.c
	mkdir bin
	gcc -c src/main.c -o bin/main.o

clean:
	rm -rvf bin/*

run:
	bin/main

start:
	make clean && make && clear && make run