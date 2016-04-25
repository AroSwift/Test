/*
Authors: Kirolos Shahat, Aaron Barlow, David DaSilva
data.h
Functionality is to open two input files titled 'ascii_1.txt' and
'ascii_2.txt' for imgOne and imgTwo. It then converts those ascii images into their
appropriate number values and writes those values into the appropriate output file
chosen by the user
*/

//assures this header file only is included once
#pragma once

//pre-defined header files that will be used in data.h
#include <iostream>
#include <fstream>
#include <ostream>
#include <cstdio>
#include <cstddef>
#include <queue>
#include <string>

using namespace std;

//defining a class where it has two ascii images and one output files
class Data{
	public:
		//imgOne = ascii_1.txt
		//imgTwo = ascii_2.txt
		ifstream imgOne, imgTwo;
		//output = either selection.train or selection.test
		//depending on which command line arguments are given or not
		ofstream output;

		Data(string nameOne, string nameTwo, string outputName, char** superiorSite = NULL);
		void wOut(ifstream& img, char **superiorSite = NULL);
		~Data();
};

//constructor to open three data files with the appropriate name values
//and either a parameter for a double character point or not depending
//on if the image is being trained. If the image is being trained, superiorSite
//is the number value passed as a command line argument to indicate which website (0 or 1)
//is the better one so the NN can correct it's weights, otherwise superior site is just
//made NULL. The constructor then checks the outputName to see if it is the train data file
//name or the test data file name and calls two instances of wOut with the parameters being
//imgOne, imgTwo and either the superiorSite, if it is passed.
Data::Data(string nameOne, string nameTwo, string outputName, char** superiorSite){
	imgOne.open(nameOne.c_str());
	imgTwo.open(nameTwo.c_str());
	output.open(outputName.c_str());
	//writing the topology to the output file
	output << 2 << " " << 198 << " " << 1 << endl;

	if(outputName == "./lib/fann/wc2fann/data/selection.train") {
		 wOut(imgOne, superiorSite);
		 wOut(imgTwo, superiorSite);
	} else{
		 wOut(imgOne);
		 wOut(imgTwo);
	}
}

//takes an ifstream parameter and either a char double pointer if the NN is
//in training, otherwise that parameter becomes NULL. Writes the ascii value into
//output and on the next line writes either the superiorSite[1] or a '1' if
//superiorSite is NULL
void Data::wOut(ifstream& img, char **superiorSite){
	queue<string> tempF;
	string f;
	int len

	//reading each line of the img file and pushing that into a queue of strings
	while(getline(img, f)){
		tempF.push(f);
	}

	//while the queue is not empty loop through the each character of the strings
	//and cast each character as an int while writing into the output file
	//if the character is a white space, write '0.255' instead
	while( !tempF.empty() ){
		len = tempF.front().length();
		//looping through each character of the string
		for (int i = 0; i< len; i++){
			if(( tempF.front() )[i] == ' ')
				output << "0.255";
			else
				output << "0." << (int)(tempF.front())[i];
			output << " ";
		}
		//popping to go to the next string in the queue
		tempF.pop();
	}

	//writing either the superiorSite or a '1' to the output file
	output << endl;
	(superiorSite == NULL) ? output << "1" : output << superiorSite[1];
	output << endl;

}

//the deconstructor closes the three image files open and deletes the class
Data::~Data(){
	imgOne.close();
	imgTwo.close();
	output.close();
}
