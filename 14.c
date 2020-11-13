#include<dirent.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main(){
	int check;
	char* dirname = "1";

	check = mkdir(dirname);
	if(!check)
		printf("Directory created\n");
	else{
		printf("Unable to create directory\n");
		exit(0);
	}
	DIR* dir;
	dir = opendir(dirname);
	if(dir == NULL)
		printf("Unable to open directory\n");
	else
		printf("Opened directory\n");
	chdir(dirname);
	FILE* f;
	f = fopen("test.txt", "w");
	char str[] = "Sai Kaushik S\nCED18I044";
	int i;
	fputs(str, f);
    fclose(f);
} 

