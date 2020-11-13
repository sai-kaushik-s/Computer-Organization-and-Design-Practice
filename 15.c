#include<dirent.h>
#include<stdio.h>
#include<stdlib.h>

void main(){
	chdir("1");
	FILE* fp;
	fp = fopen("test.txt", "r+");
	char str[] = "2nd Year CED\n";
	
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
