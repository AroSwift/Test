#pragma once
#include <iostream>
#include <stdio.h>
#include "data.h"
#include <fann.h>
#include <fann_cpp.h>

void callNN(bool fileName, string outputName);
void createOutputFile(Data* files, bool testNeural, char** superiorSite = NULL);
void trainNN(char outputName[]);
void testNN(char outputName[]);
void writeOutput(Data *files);
