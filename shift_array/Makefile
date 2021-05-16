
output: main.o shiftArray.a
	gcc -o main main.o -L. -l:shiftArray.a
main.o: main.c
	gcc -c main.c
shiftArray.a: shiftArray.o shiftArray.h
	ar -rsc shiftArray.a shiftArray.o
shiftArray.o:
	gcc -c shiftArray.c
clean:
	rm *.o
