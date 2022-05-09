CC     := clang++
CFLAGS := -Wall -Wextra -Werror -Wpedantic -fPIC -std=c++20
PREFIX ?= /usr

LIBRARY=librafpp.so
ifeq ($(shell uname -s), Darwin)
LIBRARY=librafpp.dylib
endif

all: raf_test raf_test_shared $(LIBRARY) rafpp.pc

raf_test: raf.o raf_test.o
	$(CC) raf.o raf_test.o -o raf_test

raf_test_shared: $(LIBRARY) raf_test_shared.o
	$(CC) -L. -lrafpp raf_test_shared.o -o raf_test_shared

$(LIBRARY): raf.o
	$(CC) raf.o -shared -o $(LIBRARY)

%.o: %.cpp raf.hpp
	$(CC) $(CFLAGS) -c $<

rafpp.pc: rafpp.pc.m4
	m4 -D PREFIX=$(PREFIX) rafpp.pc.m4 > rafpp.pc

install: $(LIBRARY) rafpp.pc raf.hpp
	install -m 755 $(LIBRARY) $(PREFIX)/lib/$(LIBRARY)
	install -m 644 rafpp.pc $(PREFIX)/lib/pkgconfig/rafpp.pc
	install -m 644 raf.hpp $(PREFIX)/include/raf.hpp
	install -Dm 644 LICENSE $(PREFIX)/share/licenses/librafpp/LICENSE

test: raf_test raf_test_shared
	./raf_test
	./raf_test_shared

uninstall:
	rm -f $(PREFIX)/lib/$(LIBRARY) $(PREFIX)/lib/pkgconfig/rafpp.pc $(PREFIX)/include/raf.h

test_shared: raf_test_shared
	LD_LIBRARY_PATH=. ./raf_test_shared

clean:
	rm -f raf_test raf_test_shared $(LIBRARY) raf.o raf_test.o raf_test_shared.o rafpp.pc

format:
	clang-format -i -style=file *.[ch]

.PHONY: all clean test_shared format install uninstall
