//Character by Character scanning
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
	
	c = fgetc(fptr);
	printf("\nThe contents are:\n\n");
	while (c != EOF){
		printf ("%c", c);
		c = fgetc(fptr);
	}
	
	fclose(fptr);
	return 0;
}
