/*
Authors: Kirolos Shahat, Aaron Barlow, David DaSilva
functions.h
adds prototypes that will be used in the webComp.cpp program for the trainNN() and testNN()
functions also comes with the stdio.h header file and two fann header files
and also assures that this header file can only be used once
*/


#pragma once
#include <iostream>
#include <stdio.h>
#include "data.h"
#include <fann.h>
#include <fann_cpp.h>

void trainNN();
void testNN();
