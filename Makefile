CC=gcc

CFLAGS=-c

all: main

main: quaterion_lib.o main.o
	$(CC) quaterion_lib.o main.o -o main

quaterion_lib.o: quaterion_lib.c
	$(CC) $(CFLAGS) quaterion_lib.c -o quaterion_lib.o

main.o: main.c
	$(CC) $(CFLAGS) main.c -o main.o

clean:
	rm -rf *.o cpus