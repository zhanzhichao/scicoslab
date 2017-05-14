/* Code prototype for standalone use  */
/*     Generated by Code_Generation toolbox of Scicos with scicos4.4 */
/*     date : 10-May-2017 */

/* Copyright (c) 1989-2010 Metalau project INRIA */
/* Code generation modified by Roberto Bucher */

/* ---- Headers ---- */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <memory.h>
#include <scicos_block4.h>
#include <machine.h>

#ifdef linux
#define __CONST__ static
#else
#define __CONST__ static const
#endif

double basic1_get_tsamp()
{
  return(0.1);
}

double basic1_get_tsamp_delay()
{
  return(0.1);
}

/* ---- Clock code ---- */
int basic1_useInternTimer(void) {
 return 1;
}

void rtextclk(void) { }

/* ---- Internals functions declaration ---- */
int basic1_init(void);
int basic1_isr(double);
int basic1_end(void);

/* prototype of 'rtsquare' (type 4) */
void rtsquare(scicos_block *, int );

/* prototype of 'rtmeter' (type 4) */
void rtmeter(scicos_block *, int );

/* prototype of 'bidon' (type 0) */
void C2F(bidon)(int *, int *, double *, double *, double *, int *, double *, \
                int *, double *, int *, double *, int *,int *, int *, \
                double *, int *, double *, int *);

/* def phase sim variable */
extern int phase;
/* block_error must be pass in argument of _sim function */
extern int *block_error;
/* block_number */
extern int block_number;

/* declaration of scicos block structures */
scicos_block block_basic1[2];

  /* Real parameters declaration */
  /* Routine name of block: rtsquare
   * Gui name of block: rtai4_square
   * Compiled structure index: 1
   * Exprs: 1
   */
  static double rpar_1[]={1,4,2,0,0};

  /* Integers parameters declaration */
  /* Routine name of block: rtmeter
   * Gui name of block: rtai4_meter
   * Compiled structure index: 2
   * Exprs: METER
   * ipar= {5,77,69,84,69,82};
   */
  static int ipar_2[]={5,77,69,84,69,82};

  /* Routine name of block: bidon
   * Gui name of block: EVTGEN_f
   * Compiled structure index: 3
   * Exprs: 1
   * ipar= {1};
   */
  static int ipar_3[]={1};



/* def real parameters */
double *RPAR[ ] = {
  rpar_1,
};

#ifdef linux
int NRPAR = 1;
int NTOTRPAR = 5;
char * strRPAR[1] = {"RPARAM[1]"};
int lenRPAR[1] = {5};
#endif

/* def integer parameters */
int *IPAR[ ] = {
  ipar_2,
  ipar_3,
};

#ifdef linux
int NIPAR = 2;
int NTOTIPAR = 7;
char * strIPAR[2] = {"IPARAM[1]","IPARAM[2]"};
int lenIPAR[2] = {6,1};
#endif

  /* Work array declaration */
  static void *work_1[]={0};
  static void *work_2[]={0};
  static void *work_3[]={0};

  /* Output declaration */
  static double outtb_1[]={0};

  /* Inputs */
  static int insz_2[]={1,1,SCSREAL_N};

  static void *inptr_2[]={0};

  /* Outputs */
  static int outsz_1[]={1,1,SCSREAL_N};

  static void *outptr_1[]={0};


/*----------------------------------------  Initialisation function */
int basic1_init()
{
  double t;
  int local_flag;

  /* Affectation of inptr */
  inptr_2[0] = (void *) outtb_1;

  /* Affectation of outptr */
  outptr_1[0] = (void *) outtb_1;

  /* set blk struc. of 'rtsquare' (type 4 - blk nb 1) */
  block_basic1[0].type    = 4;
  block_basic1[0].ztyp    = 0;
  block_basic1[0].ng      = 0;
  block_basic1[0].nz      = 0;
  block_basic1[0].nx      = 0;
  block_basic1[0].noz     = 0;
  block_basic1[0].nrpar   = 5;
  block_basic1[0].nopar   = 0;
  block_basic1[0].nipar   = 0;
  block_basic1[0].nin     = 0;
  block_basic1[0].nout    = 1;
  block_basic1[0].nevout  = 0;
  block_basic1[0].nmode   = 0;
  block_basic1[0].outptr  = outptr_1;
  block_basic1[0].outsz   = outsz_1;
  block_basic1[0].rpar    = rpar_1;
  block_basic1[0].work    = work_1;

  /* set blk struc. of 'rtmeter' (type 4 - blk nb 2) */
  block_basic1[1].type    = 4;
  block_basic1[1].ztyp    = 0;
  block_basic1[1].ng      = 0;
  block_basic1[1].nz      = 0;
  block_basic1[1].nx      = 0;
  block_basic1[1].noz     = 0;
  block_basic1[1].nrpar   = 0;
  block_basic1[1].nopar   = 0;
  block_basic1[1].nipar   = 6;
  block_basic1[1].nin     = 1;
  block_basic1[1].nout    = 0;
  block_basic1[1].nevout  = 0;
  block_basic1[1].nmode   = 0;
  block_basic1[1].inptr   = inptr_2;
  block_basic1[1].insz    = insz_2;
  block_basic1[1].ipar    = ipar_2;
  block_basic1[1].work    = work_2;

  /* set initial phase simulation */
  phase = 1;

  /* Initialization */

  /* Call of 'rtsquare' (type 4 - blk nb 1) */
  block_basic1[0].nevprt = 0;
  local_flag = 4;
  set_block_number(1);
  rtsquare(&block_basic1[0],local_flag);

  /* Call of 'rtmeter' (type 4 - blk nb 2) */
  block_basic1[1].nevprt = 0;
  local_flag = 4;
  set_block_number(2);
  rtmeter(&block_basic1[1],local_flag);
  return(local_flag);
}

/*----------------------------------------  ISR function */
int basic1_isr(double t)
{
  int local_flag;
  int i;
    /* Output computation */
    /* Discrete activations */
    /* Call of 'rtsquare' (type 4 - blk nb 1) */
    block_basic1[0].nevprt = 1;
    local_flag = 1;
    set_block_number(1);
    rtsquare(&block_basic1[0],local_flag);

    /* Call of 'rtmeter' (type 4 - blk nb 2) */
    block_basic1[1].nevprt = 1;
    local_flag = 1;
    set_block_number(2);
    rtmeter(&block_basic1[1],local_flag);




  return 0;
}
/*----------------------------------------  Termination function */
int basic1_end()
{
  double t;
  int local_flag;

  /* Ending */

  /* Call of 'rtsquare' (type 4 - blk nb 1) */
  block_basic1[0].nevprt = 0;
  local_flag = 5;
  set_block_number(1);
  rtsquare(&block_basic1[0],local_flag);

  /* Call of 'rtmeter' (type 4 - blk nb 2) */
  block_basic1[1].nevprt = 0;
  local_flag = 5;
  set_block_number(2);
  rtmeter(&block_basic1[1],local_flag);
  return 0;
}

