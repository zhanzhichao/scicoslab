/* Code prototype for standalone use  */
/*     Generated by Code_Generation toolbox of Scicos with scicos4.4 */
/*     date : 22-Apr-2017 */

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

double semsig_get_tsamp()
{
  return(0.001);
}

double semsig_get_tsamp_delay()
{
  return(0.1);
}

/* ---- Clock code ---- */
int semsig_useInternTimer(void) {
 return 1;
}

void rtextclk(void) { }

/* ---- Internals functions declaration ---- */
int semsig_init(void);
int semsig_isr(double);
int semsig_end(void);

/* prototype of 'rtsinus' (type 4) */
void rtsinus(scicos_block *, int );

/* prototype of 'rtai_sem_signal' (type 4) */
void rtai_sem_signal(scicos_block *, int );

/* prototype of 'rtled' (type 4) */
void rtled(scicos_block *, int );

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
scicos_block block_semsig[3];

  /* Real parameters declaration */
  /* Routine name of block: rtsinus
   * Gui name of block: rtai4_sinus
   * Compiled structure index: 1
   * Exprs: 1
   */
  static double rpar_1[]={1,1,0,0,0};

  /* Integers parameters declaration */
  /* Routine name of block: rtai_sem_signal
   * Gui name of block: rtai4_sem_signal
   * Compiled structure index: 2
   * Exprs: SEM1
   * ipar= {4,9,83,69,77,49,49,50,55,46,48,46,48,46,49};
   */
  static int ipar_2[]={4,9,83,69,77,49,49,50,55,46,48,46,48,46,49};

  /* Routine name of block: rtled
   * Gui name of block: rtai4_led
   * Compiled structure index: 3
   * Exprs: 1
   * ipar= {3,76,69,68};
   */
  static int ipar_3[]={3,76,69,68};

  /* Routine name of block: bidon
   * Gui name of block: EVTGEN_f
   * Compiled structure index: 4
   * Exprs: 1
   * ipar= {1};
   */
  static int ipar_4[]={1};



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
  ipar_4,
};

#ifdef linux
int NIPAR = 3;
int NTOTIPAR = 20;
char * strIPAR[3] = {"IPARAM[1]","IPARAM[2]","IPARAM[3]"};
int lenIPAR[3] = {15,4,1};
#endif

  /* Work array declaration */
  static void *work_1[]={0};
  static void *work_2[]={0};
  static void *work_3[]={0};
  static void *work_4[]={0};

  /* Output declaration */
  static double outtb_1[]={0};

  /* Inputs */
  static int insz_2[]={1,1,SCSREAL_N};
  static int insz_3[]={1,1,SCSREAL_N};

  static void *inptr_2[]={0};
  static void *inptr_3[]={0};

  /* Outputs */
  static int outsz_1[]={1,1,SCSREAL_N};

  static void *outptr_1[]={0};


/*----------------------------------------  Initialisation function */
int semsig_init()
{
  double t;
  int local_flag;

  /* Affectation of inptr */
  inptr_2[0] = (void *) outtb_1;
  inptr_3[0] = (void *) outtb_1;

  /* Affectation of outptr */
  outptr_1[0] = (void *) outtb_1;

  /* set blk struc. of 'rtsinus' (type 4 - blk nb 1) */
  block_semsig[0].type    = 4;
  block_semsig[0].ztyp    = 0;
  block_semsig[0].ng      = 0;
  block_semsig[0].nz      = 0;
  block_semsig[0].nx      = 0;
  block_semsig[0].noz     = 0;
  block_semsig[0].nrpar   = 5;
  block_semsig[0].nopar   = 0;
  block_semsig[0].nipar   = 0;
  block_semsig[0].nin     = 0;
  block_semsig[0].nout    = 1;
  block_semsig[0].nevout  = 0;
  block_semsig[0].nmode   = 0;
  block_semsig[0].outptr  = outptr_1;
  block_semsig[0].outsz   = outsz_1;
  block_semsig[0].rpar    = rpar_1;
  block_semsig[0].work    = work_1;

  /* set blk struc. of 'rtai_sem_signal' (type 4 - blk nb 2) */
  block_semsig[1].type    = 4;
  block_semsig[1].ztyp    = 0;
  block_semsig[1].ng      = 0;
  block_semsig[1].nz      = 0;
  block_semsig[1].nx      = 0;
  block_semsig[1].noz     = 0;
  block_semsig[1].nrpar   = 0;
  block_semsig[1].nopar   = 0;
  block_semsig[1].nipar   = 15;
  block_semsig[1].nin     = 1;
  block_semsig[1].nout    = 0;
  block_semsig[1].nevout  = 0;
  block_semsig[1].nmode   = 0;
  block_semsig[1].inptr   = inptr_2;
  block_semsig[1].insz    = insz_2;
  block_semsig[1].ipar    = ipar_2;
  block_semsig[1].work    = work_2;

  /* set blk struc. of 'rtled' (type 4 - blk nb 3) */
  block_semsig[2].type    = 4;
  block_semsig[2].ztyp    = 0;
  block_semsig[2].ng      = 0;
  block_semsig[2].nz      = 0;
  block_semsig[2].nx      = 0;
  block_semsig[2].noz     = 0;
  block_semsig[2].nrpar   = 0;
  block_semsig[2].nopar   = 0;
  block_semsig[2].nipar   = 4;
  block_semsig[2].nin     = 1;
  block_semsig[2].nout    = 0;
  block_semsig[2].nevout  = 0;
  block_semsig[2].nmode   = 0;
  block_semsig[2].inptr   = inptr_3;
  block_semsig[2].insz    = insz_3;
  block_semsig[2].ipar    = ipar_3;
  block_semsig[2].work    = work_3;

  /* set initial phase simulation */
  phase = 1;

  /* Initialization */

  /* Call of 'rtsinus' (type 4 - blk nb 1) */
  block_semsig[0].nevprt = 0;
  local_flag = 4;
  set_block_number(1);
  rtsinus(&block_semsig[0],local_flag);

  /* Call of 'rtai_sem_signal' (type 4 - blk nb 2) */
  block_semsig[1].nevprt = 0;
  local_flag = 4;
  set_block_number(2);
  rtai_sem_signal(&block_semsig[1],local_flag);

  /* Call of 'rtled' (type 4 - blk nb 3) */
  block_semsig[2].nevprt = 0;
  local_flag = 4;
  set_block_number(3);
  rtled(&block_semsig[2],local_flag);
  return(local_flag);
}

/*----------------------------------------  ISR function */
int semsig_isr(double t)
{
  int local_flag;
  int i;
    /* Output computation */
    /* Discrete activations */
    /* Call of 'rtsinus' (type 4 - blk nb 1) */
    block_semsig[0].nevprt = 1;
    local_flag = 1;
    set_block_number(1);
    rtsinus(&block_semsig[0],local_flag);

    /* Call of 'rtai_sem_signal' (type 4 - blk nb 2) */
    block_semsig[1].nevprt = 1;
    local_flag = 1;
    set_block_number(2);
    rtai_sem_signal(&block_semsig[1],local_flag);

    /* Call of 'rtled' (type 4 - blk nb 3) */
    block_semsig[2].nevprt = 1;
    local_flag = 1;
    set_block_number(3);
    rtled(&block_semsig[2],local_flag);




  return 0;
}
/*----------------------------------------  Termination function */
int semsig_end()
{
  double t;
  int local_flag;

  /* Ending */

  /* Call of 'rtsinus' (type 4 - blk nb 1) */
  block_semsig[0].nevprt = 0;
  local_flag = 5;
  set_block_number(1);
  rtsinus(&block_semsig[0],local_flag);

  /* Call of 'rtai_sem_signal' (type 4 - blk nb 2) */
  block_semsig[1].nevprt = 0;
  local_flag = 5;
  set_block_number(2);
  rtai_sem_signal(&block_semsig[1],local_flag);

  /* Call of 'rtled' (type 4 - blk nb 3) */
  block_semsig[2].nevprt = 0;
  local_flag = 5;
  set_block_number(3);
  rtled(&block_semsig[2],local_flag);
  return 0;
}

