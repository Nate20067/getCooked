#include <stdlib.h>
#include <stdio.h>
#include "vector.h"

void initVector(struct vector *vec, int capacity) {
    vec->data = (int*)malloc(sizeof(int) * capacity);
    vec->capacity = capacity;
    vec->size = 0;
}

void resizeVector(struct vector *vec, int newCapacity) {
    vec->data = (int*)realloc(vec->data, sizeof(int) * newCapacity);
    vec->capacity = newCapacity;
}

void addElement(struct vector *vec, int element) {
    if(vec->size == vec->capacity) {
        resizeVector(vec, vec->capacity * 2);
    }
    vec->data[vec->size] = element;
    vec->size++;
}

void deleteElement(struct vector *vec) {
    if(vec->size > 0) {
        vec->size--;
        if(vec->size == vec->capacity / 4) {
            resizeVector(vec, vec->capacity/2);
        }
    }
}

int vectorSize(struct vector *vec) {
    if(vec->size < 0) {
        return 1;
    }
    return vec->size;
}

int getElement(struct vector *vec, int index) {
    if(index < 0 || index > vec->capacity) {
        return 1;
    }
}

void freeVector(struct vector *vec) {
    free(vec->data);
    vec->data = NULL;
    vec->capacity = 0;
    vec->size = 0;

}
// Created by Admin on 7/16/2024.
//
