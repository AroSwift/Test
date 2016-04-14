#include <iostream>
#include<cstdlib>
#include<vector>
#include "functions.h"


using namespace std;

int main(int argc, char* argv[]){
	Data *files;
	if(argc == 2){
		files = new Data("ascii_1.txt", "ascii_2.txt", "./lib/selection.train");
		trainNN(files, argv);
		return 0;
	}
	files = new Data("ascii_1.txt", "ascii_2.txt", "./lib/selection.test");
	testNN(files);

}

void trainNN(Data* files, char** superiorSite){
	writeOutput(files->imgOne, files->output);
	files->output << " ";
	writeOutput(files->imgTwo, files->output);
	files->output << endl << superiorSite[1] << endl;
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
	vector<char> temp;
	char c;
	while(img.get(c)){
		img.ignore(1, '\n');
		temp.push_back(c);
	} 
	for(int i =0; i < temp.size(); i++){
		output << (int)temp[i];
	}
}