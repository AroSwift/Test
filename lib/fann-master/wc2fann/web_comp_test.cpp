#include <stdio.h>
#include <fann.h>
#include <fann_cpp.h>

int main()
{
	fann_type *calc_out;
	unsigned int i;
	int ret = 0;

	struct fann *ann;
	struct fann_train_data *data;

	printf("Creating network.\n");

#ifdef FIXEDFANN
	ann = fann_create_from_file("./lib/fann/wc2fann/web_comp_fixed.net");
#else
	ann = fann_create_from_file("./lib/fann/wc2fann/web_comp_config.net");
#endif

	if(!ann)
	{
		printf("Error creating ann --- ABORTING.\n");
		return -1;
	}

	fann_print_connections(ann);
	fann_print_parameters(ann);

	printf("Testing network.\n");

#ifdef FIXEDFANN
	data = fann_read_train_from_file("./lib/fann/wc2fann/web_comp_fixed.data");
#else
	data = fann_read_train_from_file("./lib/fann/wc2fann/data/selection.test");
#endif

	for(i = 0; i < fann_length_train_data(data); i++)
	{
		fann_reset_MSE(ann);
		calc_out = fann_test(ann, data->input[i], data->output[i]);
#ifdef FIXEDFANN
		printf("Web Comp test (%d, %d) -> %d, should be %d, difference=%f\n",
			   data->input[i][0], data->input[i][1], calc_out[0], data->output[i][0],
			   (float) fann_abs(calc_out[0] - data->output[i][0]) / fann_get_multiplier(ann));

		if((float) fann_abs(calc_out[0] - data->output[i][0]) / fann_get_multiplier(ann) > 0.2)
		{
			printf("Test failed\n");
			ret = -1;
		}
#else
		printf("Web Comp test (%f, %f) -> %f, should be %f, difference=%f\n",
			   data->input[i][0], data->input[i][1], calc_out[0], data->output[i][0],
			   (float) fann_abs(calc_out[0] - data->output[i][0]));

		//Web_Comp
		double answer = fann_abs(calc_out[0] - data->output[0][0]);
		FILE *output;
		output = fopen("./lib/fann/wc2fann/data/Web_Comp_Answer.txt","w");
		fprintf(output, "%f", answer);
		fclose(output);
#endif
	}

	printf("Cleaning up.\n");
	fann_destroy_train(data);
	fann_destroy(ann);

	return ret;
}
