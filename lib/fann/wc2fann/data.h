#pragma once
#include <iostream>
#include <fstream>
#include <ostream>
#include <cstdio>
#include <cstddef>
#include <queue>
#include <string>

using namespace std;

class Data{
	public:
		ifstream imgOne, imgTwo;
		ofstream output;

		Data(string nameOne, string nameTwo, string outputName, char** superiorSite = NULL);
		void wOut(ifstream& img, char **superiorSite = NULL);
		~Data();
};

Data::Data(string nameOne, string nameTwo, string outputName, char** superiorSite){
	imgOne.open(nameOne.c_str());
	imgTwo.open(nameTwo.c_str());
	output.open(outputName.c_str());
	output << 2 << " " << 198 << " " << 1 << endl;
	if(outputName == "./lib/fann/wc2fann/data/selection.train") {
		 wOut(imgOne, superiorSite);
		 wOut(imgTwo, superiorSite);
	} else{
		 wOut(imgOne);
		 wOut(imgTwo);
	}
}

void Data::wOut(ifstream& img, char **superiorSite){
	queue<string> tempF1;
	string f1;
	int len, i;

	while(getline(img, f1)){
		tempF1.push(f1);
	}

	while( !tempF1.empty() ){
		len = tempF1.front().length();
		for (i = 0; i< len; i++){
			if(( tempF1.front() )[i] == ' ')
				output << "0.255";
			else
				output << "0." << (int)(tempF1.front())[i];
			output << " ";
		}
		tempF1.pop();
	}

	output << endl;
	(superiorSite == NULL) ? output << "1" : output << superiorSite[1];
	output << endl;

}

Data::~Data(){
	imgOne.close();
	imgTwo.close();
	output.close();
}
