#include <iostream>
#include<cstdlib>
#include "functions.h"


using namespace std;

int main(int argc, char* argv[]){
	Data *files;
	if(argc == 2){
		files = new Data("ascii_1.txt", "ascii_2.txt", "selection.train");
		trainNN(files, (*argv)[1]);
		return 0;
	}
	files = new Data("ascii_1.txt", "ascii_2.txt", "selection.test");
	testNN(files);

}

void trainNN(Data* files, char superiorSite){
	writeOutput(files->imgOne, files->output);
	files->output << " ";
	writeOutput(files->imgTwo, files->output);
	files->output << endl << superiorSite << endl;
	delete files;
}

void testNN(Data* files){
	writeOutput(files->imgOne, files->output);
	files->output << " ";
	writeOutput(files->imgTwo, files->output);
	files->output << endl;
	delete files;
}

void writeOutput(ifstream& img, ofstream&output){
	string temp;
	int i = 0;
	do{
		img.ignore(100, '\n');
		img.get(temp[i]);
		i++;
	}while(!img.eof()); 
	output << ( (double)atoi(temp.c_str()))/1000.0;
}