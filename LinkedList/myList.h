#ifndef MYLIST_H
#define MYLIST_H

struct node{
int data;
struct node* next;
};

struct node* createNode(int data);

void insertAtBeginning(struct node** head, int data);

void appendToList(struct node** head, int data);

void deleteNode(struct node** head, int key);

void printNode(struct node* head);

#endif 