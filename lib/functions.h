#pragma once
#include <iostream>
#include "data.h"
//#include "fann.h"

void trainNN(Data* files, char superiorSite);
void testNN(Data* files);
void writeOutput(ifstream& img, ofstream& output);