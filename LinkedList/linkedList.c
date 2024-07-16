#include <stdio.h>
#include "myList.h"


int main(){

struct node* head = NULL;
//insertAtBeginning(&head, 13);
appendToList(&head, 14);
appendToList(&head, 22);
appendToList(&head, 17);
appendToList(&head, 20);

printf("Values in Linked List:");
printNode(head);


return 0;
}