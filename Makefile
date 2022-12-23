IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=src/obj
LDIR =lib
SRCDIR=src
APPNAME=main

LIBS=-lm

_DEPS = hello.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o hello.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

out/$(APPNAME): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 