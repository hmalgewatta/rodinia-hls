#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "nw.h"

#define ALEN 128
#define BLEN 128

char *readfile(int fd) {
  char *p;
  struct stat s;
  off_t len;
  ssize_t bytes_read, status;

  //assert(fd>1 && "Invalid file descriptor");
  assert(0==fstat(fd, &s) && "Couldn't determine file size");
  len = s.st_size;
  assert(len>0 && "File is empty");
  p = (char *)malloc(len+1);
  p[len] = 0;
  bytes_read = 0;
  while( bytes_read<len ) {
    status = read(fd, &p[bytes_read], len-bytes_read);
    assert(status>=0 && "read() failed");
    bytes_read+=status;
  }
  close(fd);
  return p;
}

char *find_section_start(char *s, int n) {
  int i=0;


  assert(n>=0 && "Invalid section number");
  if(n==0)
    return s;

  // Find the nth "%%\n" substring (if *s==0, there wasn't one)
  int idx = 0;
  while(i<n && (*s)!= '\0'){//(char)0) {
    // This comparison will short-circuit before overrunning the string, so no length check.
    if( s[0]=='%' && s[1]=='%' && s[2]=='\n' ) {
      i++;
    }
    s++;
    idx++;
  }
  if(*s!=(char)0)
    return s+2; // Skip the section header itself, return pointer to the content
  return s; // Hit the end, return an empty string
}

int parse_string(char *s, char *arr, int n) {
  int k;
  assert(s!=NULL && "Invalid input string");

  if( n<0 ) { // terminated string
    k = 0;
    while( s[k]!=(char)0 && s[k+1]!=(char)0 && s[k+2]!=(char)0
        && !(s[k]=='\n'  && s[k+1]=='%'     && s[k+2]=='%') ) {
      k++;
    }
  } else { // fixed-length string
    k = n;
  }

  memcpy( arr, s, k );
  if( n<0 )
    arr[k] = 0;

  return 0;
}

void output_to_data(int fd, void *vdata) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;
  char *p, *s;
  // Zero-out everything.
  memset(vdata,0,sizeof(struct bench_args_t));
  // Load input string
  p = readfile(fd);

  s = find_section_start(p,1);
  parse_string(s, data->alignedA, ALEN+BLEN);

  s = find_section_start(p,2);
  parse_string(s, data->alignedB, ALEN+BLEN);
}

void input_to_data(int fd, void *vdata) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;
  char *p, *s;
  // Zero-out everything.
  memset(vdata,0,sizeof(struct bench_args_t));
  // Load input string
  p = readfile(fd);

  s = find_section_start(p,1);
  parse_string(s, data->seqA, ALEN);

  //printf("SeqA: input %s\n", data->seqA);

  s = find_section_start(p,2);
  parse_string(s, data->seqB, BLEN);

}

int check_data( void *vdata, void *vref ) {
  struct bench_args_t *data = (struct bench_args_t *)vdata;
  struct bench_args_t *ref = (struct bench_args_t *)vref;
  int has_errors = 0;

  has_errors |= memcmp(data->alignedA, ref->alignedA, ALEN+BLEN);
  printf("Has errors %d", has_errors);
  printf("dataA :%s\n ref A:%s\n", data->alignedA, ref->alignedA);
  has_errors |= memcmp(data->alignedB, ref->alignedB, ALEN+BLEN);
  printf("Has errors %d", has_errors);
  // Return true if it's correct.
  return !has_errors;
}

int check_mem_data( const void *vdata, const void *vref ) {
  int has_errors = 0, i;
  char **str = (char**)vdata;
  char **strr = (char**)vref;
  printf("cmp len: %d\n", ALEN+BLEN);
  has_errors |= memcmp(vdata, vref, ALEN+BLEN);
  for (i = 0; i <  ALEN+BLEN;  i++)
	  printf("%c:%c ",str[i], strr[i]);
  has_errors |= memcmp(vdata, vref, ALEN+BLEN);
  printf("\nHas errors %d\n", has_errors);
  // Return true if it's correct.
  return !has_errors;
}

int main(){

	int INPUT_SIZE = sizeof(struct bench_args_t);

	char const *in_file = "input.data";
	char const *check_file = "check.data";
	// const int num_jobs = 1 << 10;
	const int num_jobs = NUM_JOBS; // 1;
	int in_fd, check_fd;
	// char *data;
	struct bench_args_t* data;
	// struct bench_args_t *data;
	data = (struct bench_args_t *) malloc(INPUT_SIZE);
	//data = (struct bench_args_t *) calloc(INPUT_SIZE, 1);
	assert( data!=NULL && "Out of memory" );
	in_fd = open( in_file, O_RDONLY );
	assert( in_fd>0 && "Couldn't open input data file");
	input_to_data(in_fd, data);

	//char* seqA_batch = (char *)malloc(sizeof(((struct bench_args_t*)data)->seqA) * num_jobs);
	//char* seqB_batch = (char *)malloc(sizeof(((struct bench_args_t*)data)->seqB) * num_jobs);
	//char* alignedA_batch = (char *)malloc(sizeof(((struct bench_args_t*)data)->alignedA) * num_jobs);
	//char* alignedB_batch = (char *)malloc(sizeof(((struct bench_args_t*)data)->alignedB) * num_jobs);

	char* seqA_batch = (char *)malloc(sizeof(data->seqA) * num_jobs);
	char* seqB_batch = (char *)malloc(sizeof(data->seqB) * num_jobs);
	char* alignedA_batch = (char *)malloc(sizeof(data->alignedA) * num_jobs);
	char* alignedB_batch = (char *)malloc(sizeof(data->alignedB) * num_jobs);

	//char* seqA_batch = (char *)calloc(num_jobs,sizeof(data->seqA) );
	//char* seqB_batch = (char *)calloc(num_jobs,sizeof(data->seqB));
	//char* alignedA_batch = (char *)calloc(num_jobs,sizeof(data->alignedA));
	//char* alignedB_batch = (char *)calloc(num_jobs,sizeof(data->alignedB));

	//const int arr_size = sizeof(data->seqB)*num_jobs;
	//const int arr_size2 = sizeof(data->alignedA)*num_jobs;
	//char seqA_batch[arr_size];
	//char seqB_batch[arr_size];
	///char alignedA_batch[arr_size2];
	//char alignedB_batch[arr_size2];
	int ress;
	struct bench_args_t *ref;
		ref = (struct bench_args_t *) malloc(INPUT_SIZE);
		assert( ref!=NULL && "Out of memory" );
		check_fd = open( check_file, O_RDONLY );
		assert( check_fd>0 && "Couldn't open check data file");
		output_to_data(check_fd, ref);

	int i;
	  for (i=0; i<num_jobs; i++) {
	    memcpy(seqA_batch + i*sizeof(data->seqA), data->seqA, sizeof(data->seqA));
	    memcpy(seqB_batch + i*sizeof(data->seqB), data->seqB, sizeof(data->seqB));
	  }

	workload(seqA_batch, seqB_batch, alignedA_batch, alignedB_batch, num_jobs);
	// workload((unsigned long*)seqA_batch, (unsigned long*)seqB_batch, (unsigned long*)alignedA_batch, (unsigned long*)alignedB_batch, num_jobs);
	memcpy(data->alignedA, alignedA_batch, sizeof(data->alignedA));
	memcpy(data->alignedB, alignedB_batch, sizeof(data->alignedB));
	printf("Res %d\n", ress);
	//printf("A batch: %s\n", alignedA_batch);
	//printf("B batch: %s\n", alignedB_batch);

	//if( !check_data(data, ref) ) {
	//    printf("Benchmark results are incorrect\n");
	//    return -1;
	//}
	if ( !check_mem_data(alignedA_batch, ref->alignedA)){
		printf("benchmark results dont match");
		return -1;
	}
	return 0;
}
