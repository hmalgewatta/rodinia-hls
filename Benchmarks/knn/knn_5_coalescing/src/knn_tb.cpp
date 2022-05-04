#include <string.h>
#include "knn.h"

void input_to_data(int fd, void *vdata) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;

  for(int i = 0; i < NUM_FEATURE; ++i){
  	data->input_query[i] = i + 1.0;
  }

  for(int i = 0; i<NUM_PT_IN_SEARCHSPACE*NUM_FEATURE; ++i){
  	data->search_space_data[i] = i + 1.0;
  }

}

int check_data( void *vdata, void *vref ) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;
  struct bench_args_t *ref = (struct bench_args_t *)vref;
  int has_errors = 0;

  for(int i = 0; i < NUM_PT_IN_SEARCHSPACE; i++){
  	if(data->distance[i] != ref->distance[i]){
  		has_errors++;
  	}
  }

  if (has_errors == 0)
	  printf("PASS");
  else
	  printf("FAIL");

  return !has_errors;
}

void output_to_data(int fd, void *vdata) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;

  for(int i = 0; i < NUM_FEATURE; ++i){
  	data->input_query[i] = i + 1.0;
  }

  for(int i = 0; i<NUM_PT_IN_SEARCHSPACE*NUM_FEATURE; ++i){
  	data->search_space_data[i] = i + 1.0;
  }

  float sum = 0.0;
  float delta = 0.0;
  for(int i = 0; i < NUM_PT_IN_SEARCHSPACE; i++ ) {
  	sum = 0.0;
  	for (int j = 0; j < NUM_FEATURE; ++j){
  		delta = data->search_space_data[i*NUM_FEATURE+j] - data->input_query[j];
	    sum += delta * delta;
		}

		data->distance[i] = sum;
	}
  /* char *p, *s;

  // Zero-out everything.
  memset(vdata,0,sizeof(struct bench_args_t));

  // Load input string
  p = readfile(fd);

  s = find_section_start(p,1);
  STAC(parse_,TYPE,_array)(s, data->temp, GRID_ROWS * GRID_COLS); */
}

int main()
{
	struct bench_args_t *args, *ref;
	args = (struct bench_args_t *) malloc(sizeof(struct bench_args_t));
	ref = (struct bench_args_t *) malloc(sizeof(struct bench_args_t));
	input_to_data(0, args);
	input_to_data(0, ref);
	output_to_data(0, ref);
	workload(args->input_query, (INTERFACE_WIDTH*) args->search_space_data, (INTERFACE_WIDTH*)args->distance );
	if (!check_data(args, ref))
		return -1;
	return 0;
}
