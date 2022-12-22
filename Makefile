export LD_LIBRARY_PATH=./Criterion/build/src:$LD_LIBRARY_PATH
INCD = -I ./Criterion/include
LIBD = -L ./Criterion/build/src
CFLAGS = -g -Wall -Wextra -Wshadow -Wdouble-promotion -Wformat=2 -Wundef -DDEBUG
EXTRA_CFLAGS = -pedantic

all: hw0 tests

hw0: hw0.o
	gcc main.c -o hw0 hw0.o 

hw0.o: hw0.c
	gcc $(CFLAGS) $(EXTRA_CFLAGS) $(INCD) -c hw0.c

criterion:
	cd Criterion && meson build && ninja -C build && cd ..

tests: tests.o hw0.o
	gcc -lcriterion $(LIBD) -o tests tests.o hw0.o

tests.o: tests.c
	gcc $(CFLAGS) $(EXTRA_CFLAGS) $(INCD) -c tests.c

test:
	./tests

clean:
	rm -f hw0 tests *.o

.PHONY: all criterion test