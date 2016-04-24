#pragma once
#include <iostream>
#include <stdio.h>
#include "data.h"
#include <fann.h>
#include <fann_cpp.h>

//void createOutputFile(Data* files, bool testNeural, char** superiorSite = NULL);
void trainNN();
void testNN();
void writeOutput(Data *files, bool testNeural, char** superiorSite = NULL);
