#include <stdio.h>
#include "shift_array.h"

#define ARRAY_LENGTH 3

int main() {
    int array[ARRAY_LENGTH] = {1, 2, 3};
    const int shift = 2;
    int length = ARRAY_LENGTH;
    shiftArray(array, shift, length);
    
    for (int i = 0; i < ARRAY_LENGTH; ++i) {
        printf("%d ", array[i]);
    }
}

