//line by line scanning
#include<stdio.h>
#include<stdlib.h>

int main(){
    FILE * fp;
    
    char filename[100];
	
	printf("Enter the filename to open: ");
	scanf("%s", filename);

    fp = fopen(filename, "r");
    
    if (fp == NULL){
		printf("Cannot open file \n");
		exit(0);
	}
	
	char c[50];
    
    int i = 0;
	fpos_t position;
	fseek(fp, 0, 2);
	fgetpos(fp, &position);
	
	fseek(fp, 0, 0);
	fgets(c, 50, fp);
	
	printf("\nThe contents are:\n\n");
	while (i * 50 < position){
        printf("%s", c);
        fgets(c, 50, fp);
		i++;
	}

    fclose(fp);
}
