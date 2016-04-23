/*
Kirolos Shahat, Aaron Barlow, David DaSilva
webComp.cpp
The purpose of this program is to open up two files titled
'ascii_1.txt' and 'ascii_2.txt' and convert those images into
their appropriate number values and print those numbers into a
created output file titled either 'selection.train' or
'selection.test' depending on if a command line argument was given
or not. If a command line argument was given, the argument would be an int
which represents the superior website to choose indicating that the Neural
Network would still be in training and that number needs to be printed in the
output file 'selection.train'
The first line of both output files is the topology for the Neural network.
*/

//the header files used in the program
#include <iostream>
#include <cstdlib>
#include <queue>
#include <cstddef>
#include "functions.h"

using namespace std;

//the command line arguments. Can either be 1 or 2 arguments
int main(int argc, char* argv[]){
	Data *files;
	//Defining the names of the ascii images as strings to be called later
	string asciiOne = "./lib/fann/wc2fann/data/ascii_1.txt";
	string asciiTwo = "./lib/fann/wc2fann/data/ascii_2.txt";
	bool testNN;

	//if there is something added with the program executable
	//then it is the superior image meaning that the NN is still
	//in training.
	if(argc == 2){
		testNN = false;

		//calling the constructor for the class Data with the three
		//image names that are associated. This opens three files with
		//the names associated
		files = new Data(asciiOne, asciiTwo,
											"./lib/fann/wc2fann/data/selection.train");
		//calls the createOutputFile file function which converts each values
		//in each ascii text file into it's appropriate number value and writes
		//it to 'selection.train' is also passed a boolean so that
		//it can distinguish between either training or testing, and the
		//value that the NN should be choosing and writes that into the file aswell
		createOutputFile(files, testNN, argv); //if NN is called change
		//false to testNN and remove the comments above and below
	}
	//there are no command line arguments and the NN is being tested
	else{
		testNN = true;

		//calling the constructor for the class Data with the three
		//image names that are associated. This opens three files with
		//the names associated
		files = new Data(asciiOne, asciiTwo,
											"./lib/fann/wc2fann/data/selection.test");
		//calls the createOutputFile file function which converts each values
		//in each ascii text file into it's appropriate number value and writes
		//it to 'selection.train' is also passed a boolean so that
		//it can distinguish between either training or testing
		createOutputFile(files, testNN);
	}
	callNN(testNN);
}

/*int FANN_API test_callback(struct fann *ann, struct fann_train_data *train, unsigned int max_epochs, unsigned int epochs_between_reports, float desired_error, unsigned int epochs){
	printf("Epochs     %8d. MSE: %.5f. Desired-MSE: %.5f\n", epochs, fann_get_MSE(ann), desired_error);
    return 0;
}*/

void createOutputFile(Data* files, bool testNeural, char** superiorSite){
	writeOutput(files);
	files->output << endl;
	if(!testNeural) files->output << superiorSite[1] << endl;
	delete files;
}

void writeOutput(Data *files){
  queue<char> tempF1, tempF2;
	char f1, f2;
	while(files->imgOne.get(f1) && files->imgTwo.get(f2)){
		files->imgOne.ignore(1, '\n');
		files ->imgTwo.ignore(1, '\n');
		tempF1.push(f1);
		tempF2.push(f2);
	}
	files->output << (int)tempF1.front() << " " << (int)tempF2.front();
	tempF1.pop();
	tempF2.pop();
	while(!tempF1.empty() && !tempF2.empty()){
			files->output << " " << (int)tempF1.front() << " " << (int)tempF2.front();
			tempF1.pop();
			tempF2.pop();
	}
}

void callNN(bool chooseNN){
	chooseNN ? testNN() : trainNN();
}


void trainNN(){

    //fann requirements
	fann_type *calc_out;
	const unsigned int num_input = 2;
	const unsigned int num_output = 1;
	const unsigned int num_layers = 3;
	const unsigned int num_neurons_hidden = 3;
	const float desired_error = (const float) 0;
	const unsigned int max_epochs = 1000;
	const unsigned int epochs_between_reports = 10;
	struct fann *ann;
	struct fann_train_data *data;

	unsigned int i = 0;
	unsigned int decimal_point;

	printf("Creating network.\n");
	ann = fann_create_standard(num_layers, num_input, num_neurons_hidden, num_output);

	data = fann_read_train_from_file("selection.train");

	fann_set_activation_steepness_hidden(ann, 1);
	fann_set_activation_steepness_output(ann, 1);

	fann_set_activation_function_hidden(ann, FANN_SIGMOID_SYMMETRIC);
	fann_set_activation_function_output(ann, FANN_SIGMOID_SYMMETRIC);

	fann_set_train_stop_function(ann, FANN_STOPFUNC_BIT);
	fann_set_bit_fail_limit(ann, 0.01f);

	fann_set_training_algorithm(ann, FANN_TRAIN_RPROP);

	fann_init_weights(ann, data);

	printf("Training network.\n");
	fann_train_on_data(ann, data, max_epochs, epochs_between_reports, desired_error);

	printf("Testing network. %f\n", fann_test_data(ann, data));

	for(i = 0; i < fann_length_train_data(data); i++){
			calc_out = fann_run(ann, data->input[i]);
			printf("Web_Comp test (%f,%f) -> %f, should be %f, difference=%f\n",
				   data->input[i][0], data->input[i][1], calc_out[0], data->output[i][0],
				   fann_abs(calc_out[0] - data->output[i][0]));
	}

	printf("Saving network.\n");

	fann_save(ann, "web_comp_config.net");

	decimal_point = fann_save_to_fixed(ann, "web_comp_fixed.net");
	fann_save_train_to_fixed(data, "web_comp_fixed.data", decimal_point);

	printf("Cleaning up.\n");
	fann_destroy_train(data);
	fann_destroy(ann);


}

void testNN(){
        fann_type *calc_out;
        unsigned int i;
        //int ret = 0;

        struct fann *ann;
        struct fann_train_data *data;

        printf("Creating network.\n");

#ifdef FIXEDFANN
        ann = fann_create_from_file("web_comp_fixed.net");
#else
        ann = fann_create_from_file("web_comp_config.net");
#endif

        if(!ann)
        {
                printf("Error creating ann --- ABORTING.\n");
               // return -1;
        }

        fann_print_connections(ann);
        fann_print_parameters(ann);

        printf("Testing network.\n");

#ifdef FIXEDFANN
        data = fann_read_train_from_file("web_comp_fixed.data");
#else
        data = fann_read_train_from_file("selection.test");
#endif

        for(i = 0; i < fann_length_train_data(data); i++)
        {
                fann_reset_MSE(ann);
                calc_out = fann_test(ann, data->input[i], data->output[i]);
#ifdef FIXEDFANN
                printf("Web_Comp test (%d, %d) -> %d, should be %d, difference=%f\n",
                           data->input[i][0], data->input[i][1], calc_out[0], data->output[i][0],
                           (float) fann_abs(calc_out[0] - data->output[i][0]) / fann_get_multiplier(ann));

                if((float) fann_abs(calc_out[0] - data->output[i][0]) / fann_get_multiplier(ann) > 0.2)
                {
                        printf("Test failed\n");
                        ret = -1;
                }
#else
                printf("web_comp test (%f, %f) -> %f, should be %f, difference=%f\n",
                           data->input[i][0], data->input[i][1], calc_out[0], data->output[i][0],
                           (float) fann_abs(calc_out[0] - data->output[i][0]));

                //Web_Comp
                double answer = fann_abs(calc_out[0] - data->output[0][0]);
                FILE *output;
                output = fopen("Web_Comp_Answer.txt","w");
                fprintf(output, "%f", answer);
                fclose(output);
#endif
        }

        printf("Cleaning up.\n");
        fann_destroy_train(data);
        fann_destroy(ann);

//        return ret;
}
