CC      ?= gcc
CFLAGS  += -std=c99 -Wall -Wextra -pedantic -Wold-style-declaration
CFLAGS  += -Wmissing-prototypes -Wno-unused-parameter
LDFLAGS += -lX11 -lXcursor
OPT     ?= -O3

EXE = qqqwm

SRC = qqqwm.c
OBJ = $(SRC:.c=.o)

PREFIX  ?= /usr
BINDIR  ?= $(PREFIX)/bin

.PHONY: all install uninstall clean

all: $(EXE)

$(EXE): $(OBJ)
	$(CC) $(OPT) $(CFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.c config.h Makefile
	$(CC) $(OPT) $(CFLAGS) -c $< -o $@

install: all
	install -Dm755 $(EXE) $(DESTDIR)$(BINDIR)/$(EXE)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(EXE)

clean:
	rm -f $(EXE) $(OBJ)