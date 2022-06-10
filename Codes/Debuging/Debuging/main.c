#include<stdio.h>
#include<stdlib.h>
#define LEN sizeof(struct data_type)
struct data_type
{
    int data;
    struct data_type* next;
};
struct data_type* create(void)
{
    int n=0;
    struct data_type* head;
    struct data_type* p_tail;
    struct data_type* p_new;
    n=0;
    head=NULL;
    p_tail=p_new=(struct data_type*)malloc(LEN);
    scanf("%d",&p_new->data);
    while (p_new->data!=0)
    {
        n=n+1;
        if (n==1)
        {
            head=p_tail;  //第一次建立的时候把head赋在首个节点
        }
        p_tail=p_new;
        p_new=(struct data_type*)malloc(LEN);
        scanf("%d",&p_new->data);
    }
    return head;
}
void print(struct data_type* data)
{
    struct data_type *p;
    p=data; //赋于头指针
    if (data!=NULL)
    {
        do
        {
            printf("%d",p->data);
            p=p->next;
        } while (p!=NULL);
        
    }
    
    
    
}
int main()
{
    struct data_type* data;
    data=create();
    print(data);
    return 0;
}
