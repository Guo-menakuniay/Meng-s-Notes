#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MARKN 3
#define NAMELEN 40
char filename[10];

int main()
{
FILE *rfp;
int no,i;
char name[NAMELEN];
int mark;
printf("Enter file name.\n");
scanf("%s",filename);
if((rfp=fopen(filename,"r"))==NULL)
{
 printf("Can't open %s file.\n",filename);
 exit(0);
}

printf("\nSTUDENTS INFOR TABLE\n");
printf("-----------------------------------\n");
printf("NO\tNAME\tMARKS\n");
printf("-----------------------------------\n");

fscanf(rfp,"%d%s",&no,name);
while(!feof(rfp))
{
    printf("%d\t%s",no,name);
    for(i=0;i<MARKN;i++)
    {
        fscanf(rfp,"%d",&mark);
        printf("\t%2d",mark);
    }
  printf("\n");
  fscanf(rfp,"%d%s",&no,name);
}
  fclose(rfp);
  printf("----------------------------------\n");
  return 0;
}

