#pragma once
#include <iostream>
#include <stdio.h>
#include "data.h"
#include <fann.h>
#include <fann_cpp.h>

void callNN(bool fileName);
/*int FANN_API test_callback(struct fann *ann, struct fann_train_data *train,
        unsigned int max_epochs, unsigned int epochs_between_reports,
        float desired_error, unsigned int epochs);*/
void createOutputFile(Data* files, bool testNeural, char** superiorSite = NULL);
//void trainNN();
//void testNN();
void writeOutput(Data *files);
