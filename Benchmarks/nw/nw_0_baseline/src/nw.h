#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>

#define ALEN 128
#define BLEN 128
#define NUM_JOBS 1<<8

// Test harness interface code.

//#define INTERFACE_WIDTH ap_uint<512>

struct __attribute__ ((aligned(64))) bench_args_t {
  char seqA[ALEN];
  char seqB[BLEN];
  char alignedA[ALEN+BLEN];
  char alignedB[ALEN+BLEN];
  int M[(ALEN+1)*(BLEN+1)];
  char ptr[(ALEN+1)*(BLEN+1)];
};

//extern "C" void workload(uint64_t* SEQA, uint64_t* SEQB,uint64_t* alignedA, uint64_t* alignedB, int num_jobs);
//void workload(uint64_t* SEQA, uint64_t* SEQB,uint64_t* alignedA, uint64_t* alignedB, int num_jobs);
//void workload(volatile char* SEQA, volatile char* SEQB,volatile char* alignedA, volatile char* alignedB, int num_jobs);
extern "C" void workload( char* SEQA,  char* SEQB, char* alignedA,  char* alignedB, int num_jobs);

