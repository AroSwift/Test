#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstddef>
#include "functions.h"
//#include "fann.h"

using namespace std;

int main(int argc, char* argv[]){
	Data *files;
	bool testNN;
	if(argc == 2){
		testNN = false;
		string outputName = "./lib/fann/wc2fann/data/selection.train";
		files = new Data("./lib/fann/wc2fann/data/ascii_1.txt",
											"./lib/fann/wc2fann/data/ascii_2.txt", outputName);
		createOutputFile(files, testNN, argv);
	}
	else{
		testNN = true;
		files = new Data("./lib/fann/wc2fann/data/ascii_1.txt",
		 								"./lib/fann/wc2fann/data/ascii_2.txt",
										"./lib/selection.test");
		createOutputFile(files, true);
	}
	//callNN(testNN);
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
	vector<char> tempF1, tempF2;
	char f1, f2;
	while(files->imgOne.get(f1) && files->imgTwo.get(f2)){
		files->imgOne.ignore(1, '\n');
		files ->imgTwo.ignore(1, '\n');
		tempF1.push_back(f1);
		tempF2.push_back(f2);
	}
	int z = tempF1.size();
	for(int i =0; i < z; i++){
		if(i==0)
			files->output << (int)tempF1[i] << " " << (int)tempF2[i];
		else
			files->output << " " << (int)tempF1[i] << " " << (int)tempF2[i];
	}
}

/*void callNN(bool chooseNN){
	chooseNN ? testNN() : trainNN();
}*/


/*void trainNN(){

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
        int ret = 0;

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
*/
