#include <stdio.h>
#include <stdlib.h>
#include "myList.h"

struct node* createNode(int data){
   struct node* newNode = (struct node*)malloc(sizeof(struct node));
   if(newNode == NULL){
      printf("Memory Leak not good");
      exit(1);
    }
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

void insertAtBeginning(struct node** head, int data){
  struct node* newNode = createNode(data);
  newNode->next = *head;
  *head = newNode;
}

void appendToList(struct node** head, int data){
 struct node* newNode = createNode(data);
 if(*head == NULL){
 *head = newNode;
 return;
}

 struct node* temp = *head;
 while(temp->next != NULL){
 temp = temp->next;
}

 temp->next = newNode;

}

void deleteNode(struct node** head, int key){
 struct node* temp = *head;
 struct node* prev = NULL;

 if((temp->next != NULL) && (temp->data == key)){
  *head = temp->next;
   free(temp);
   return;
 }

 while(temp->next != NULL && temp->data !=key){
  prev = temp;
  temp = temp->next;
}

 if(temp == NULL) return;

 prev->next = temp->next;
 free(temp);
}

void printNode(struct node* head){
struct node* temp = head;

if(temp == NULL){
 printf("The linkedlist is empty\n");
 printf("Can't print the list");
 return;
}

while(temp != NULL){
 printf("%d\n", temp->data);
 temp = temp->next;
}

}



