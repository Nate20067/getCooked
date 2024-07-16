#include <stdio.h>
#include "vector.h"

int main(void) {
     struct vector vec;
     initVector(&vec, 5);
     addElement(&vec, 13);
     addElement(&vec, 11);
     addElement(&vec, 12);
     addElement(&vec, 17);
     addElement(&vec, 11);
     addElement(&vec, 11);

    printf("The elements in the vector: ");
    for(int i = 0; i < vec.size; i++){
        printf("%d\n", getElement(&vec, i));
    }
}
