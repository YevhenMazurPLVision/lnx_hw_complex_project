CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -Iinclude
LIBDIR  = lib


CALC_SRC    = src/calc/add_sub_mul_div.c src/calc/factorial.c src/calc/sqrt.c
CALC_OBJ    = $(CALC_SRC:.c=.o)

CONVERT_SRC = src/convert/convert.c
CONVERT_OBJ = $(CONVERT_SRC:.c=.o)

.PHONY: all task1 task2 install_convert clean unistall_convert

all: calc upper lower
task1: calc
task2: upper lower

calc: apps/calc
upper: apps/upper
lower: apps/lower

install_convert: $(LIBDIR)/libconvert.so
	sudo cp $(LIBDIR)/libconvert.so /usr/local/lib/
	sudo chmod 755 /usr/local/lib/libconvert.so
	sudo ldconfig

$(LIBDIR):
	mkdir -p $(LIBDIR)

clean:
	rm -f src/calc/*.o src/convert/*.o
	rm -f $(LIBDIR)/libcalc.a $(LIBDIR)/libconvert.so
	rm -f apps/calc apps/upper apps/lower

uninstall_convert:
	 sudo rm -f /usr/local/lib/libconvert.so
	 sudo ldconfig

apps/calc: apps/main.c $(LIBDIR)/libcalc.a
	$(CC) $(CFLAGS) $< -L$(LIBDIR) -lcalc -lm -o $@
apps/upper: apps/upper.c $(LIBDIR)/libconvert.so
	$(CC) $(CFLAGS) $< -L$(LIBDIR) -lconvert -o $@
apps/lower: apps/lower.c $(LIBDIR)/libconvert.so
	$(CC) $(CFLAGS) $< -L$(LIBDIR) -lconvert -o $@


$(LIBDIR)/libcalc.a: $(CALC_OBJ) | $(LIBDIR)
	ar rcs $@ $^
$(LIBDIR)/libconvert.so: $(CONVERT_OBJ) | $(LIBDIR)
	$(CC) -shared -o $@ $^


src/calc/%.o: src/calc/%.c
	$(CC) $(CFLAGS) -c $< -o $@
src/convert/%.o: src/convert/%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@
