//Char by char scanning
#include <stdio.h> 
#include <stdlib.h>

int main(){
	
	FILE *fptr;
	char filename[100], c;
	
	printf("Enter the filename to open: ");
	scanf("%s", filename);
	fptr = fopen(filename, "r");
	
	if (fptr == NULL){
		printf("Cannot open file \n");
		exit(0);
	}
	int i = 0;
	fpos_t position;
	fseek(fptr, 0, 2);
	fgetpos(fptr, &position);
	
	fseek(fptr, 0, 0);
	
	c = fgetc(fptr);
	printf("\nThe contents are:\n\n");
	while (i < position){
		printf ("%c", c);
		c = fgetc(fptr);
		i++;
	}
	
	fclose(fptr);
	return 0;
}
