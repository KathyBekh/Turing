#include "shiftArray.h"

int main() {
    int array[3] = {1, 2, 3};
    const int shift = 2;
    int length = sizeof(array)/sizeof(int);
    printf("Start Array: [");
    for(int i = 0; i < length; i++) {
        printf("%d", array[i]);
        if(i != length - 1) printf(", ");
    }
    printf("]\nshift = %d\n", shift);
    shiftArray(array, length, shift);
    printf("End Array: [");
    for (int i = 0; i < length; ++i) {
        printf("%d ", array[i]);
    }
    printf("]\n");
    return 0;
}

