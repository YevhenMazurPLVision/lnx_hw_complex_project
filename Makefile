CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -Iinclude
LIBDIR  = $(BUILDDIR)/lib
BUILDDIR = build


CALC_SRC    = src/calc/add_sub_mul_div.c src/calc/factorial.c src/calc/sqrt.c
# .c -> .o і додаємо префікс build/ => build/src/calc/...
CALC_OBJ    = $(addprefix $(BUILDDIR)/, $(CALC_SRC:.c=.o))

CONVERT_SRC = src/convert/convert.c
CONVERT_OBJ = $(addprefix $(BUILDDIR)/, $(CONVERT_SRC:.c=.o))

.PHONY: all task1 task2 install_convert clean clean-task1 clean-calc clean-task2 clean-upper clean-lower uninstall_convert

all: calc upper lower
task1: calc
task2: upper lower

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

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
	rm -rf $(BUILDDIR)
	rm -f $(LIBDIR)/libcalc.a $(LIBDIR)/libconvert.so
	rm -f apps/calc apps/upper apps/lower
	rm -f src/calc/*.o src/convert/*.o

clean-task1: clean-calc
	rm -f $(LIBDIR)/libcalc.a
	rm -rf $(BUILDDIR)/src/calc

clean-task2: clean-upper clean-lower
	rm -f $(LIBDIR)/libconvert.so
	rm -rf $(BUILDDIR)/src/convert

clean-calc:
	rm -f apps/calc

clean-upper:
	rm -f apps/upper

clean-lower:
	rm -f apps/lower

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

$(BUILDDIR)/src/calc/%.o: src/calc/%.c | $(BUILDDIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILDDIR)/src/convert/%.o: src/convert/%.c | $(BUILDDIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

