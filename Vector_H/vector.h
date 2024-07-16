

#ifndef VECTOR_H
#define VECTOR_H

struct vector {
    int *data;
    int size;
    int capacity;
};

void initVector(struct vector *vec, int capacity);

void resizeVector(struct vector *vec, int newCapacity);

void addElement(struct vector *vec, int element);

void deleteElement(struct vector *vec);

int vectorSize(struct vector *vec);

int getElement(struct vector *vec, int index);

void printVector(struct vector *vec);

void freeVector(struct vector *vec);

#endif
//VECTOR_H
