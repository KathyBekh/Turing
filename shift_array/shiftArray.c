#include "shiftArray.h"

void shiftArray(int array[], int length, int shift) {
	for(int j = 0; j < shift; ++j) {
		int tmp = array[0];
		for(int i = 0; i < length - 1; ++i) {
			array[i] = array[i+1];
		}
		array[length -1] = tmp;
	}
}
