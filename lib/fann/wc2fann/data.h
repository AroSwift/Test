#pragma once
#include <iostream>
#include <fstream>
#include <ostream>
#include <cstdio>
#include <string>

using namespace std;

class Data{
	public:
		ifstream imgOne, imgTwo;
		ofstream output;

		Data(string nameOne, string nameTwo, string outputName);
		~Data();
};

Data::Data(string nameOne, string nameTwo, string outputName){
	imgOne.open(nameOne.c_str());
	imgTwo.open(nameTwo.c_str());
	output.open(outputName.c_str());
	output << 230 << " " << 800 << " " << 1 << endl;
}
Data::~Data(){
	imgOne.close();
	imgTwo.close();
	output.close();
}
