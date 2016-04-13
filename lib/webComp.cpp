#include <iostream>
#include <fstream>
#include <ostream>
#include <string>
//#include "fann.h"


double outputFileStore(ifstream& img);
using namespace std;

int main(int argc, char* argv[]){
	ifstream imgOne, imgTwo;
	double value_img1, value_img2;
	ofstream output;
	imgOne.open("ascii_1.txt");
	imgTwo.open("ascii_2.txt");
	output.open("selection.txt");

	value_img1 = outputFileStore(imgOne);
	value_img2 = outputFileStore(imgTwo);
	if(argc == 2){
		output << value_img1 << " " << value_img2 << endl;
		if((*argv)[1] == '1') ? : output << value_img1; : output << value_img2;
		return 0;
	}
	output << value_img1 << " " << value_img2;

}


double outputFileStore(ifstream& img){
	char c;
	double sum = 0;
	do{
		img.ignore(100, '\n');
		img.get(c);
		sum += (int) c;
	}while(!img.eof()); 
	img.close();
	return sum; //divide it by the appropriate value here
}