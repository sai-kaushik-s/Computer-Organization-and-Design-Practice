#include<dirent.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define MAX 256

void main(){
	chdir("1");
	FILE* fp;
	fp = fopen("test.txt", "r+");
	char str[MAX];
	printf("Enter the string to be inserted:  ");
	scanf("%s", str);
	
	fpos_t end;
	fseek(fp, 0, 2);
	fgetpos(fp, &end);
	
	fseek(fp, 0, 0);
	char c = fgetc(fp);
	int j = 0;
	while (c != '\n'){
		j++;
		c = fgetc(fp);
	}
	
	char s[end - j];
	
	fgets(s, end - j, fp);
	
	
	fseek(fp, j + 1, 0);
	fputs(str, fp);
	fputs(s, fp);
	fclose(fp);
}
