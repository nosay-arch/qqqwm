CFLAGS += -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS += -Wmissing-prototypes -Wno-unused-parameter

LDFLAGS += -lX11 -lXcursor

PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

EXE = nullwm
CC  ?= gcc

all: nullwm

nullwm: nullwm.c nullwm.h config.h Makefile
	$(CC) -O3 $(CFLAGS) -o $(EXE) $(LDFLAGS)

install: all
	install -Dm755 $(EXE) $(DESTDIR)$(BINDIR)/$(EXE)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(EXE)

clean:
	rm -f $(EXE) *.o

.PHONY: all install uninstall clean