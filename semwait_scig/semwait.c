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

double semwait_get_tsamp()
{
  return(0.001);
}

double semwait_get_tsamp_delay()
{
  return(0.1);
}

/* ---- Clock code ---- */
int semwait_useInternTimer(void) {
 return 1;
}

void rtextclk(void) { }

/* ---- Internals functions declaration ---- */
int semwait_init(void);
int semwait_isr(double);
int semwait_end(void);

/* prototype of 'rtai_sem_wait' (type 4) */
void rtai_sem_wait(scicos_block *, int );

/* prototype of 'rtled' (type 4) */
void rtled(scicos_block *, int );

/* prototype of 'rtscope' (type 4) */
void rtscope(scicos_block *, int );

/* prototype of 'rtsinus' (type 4) */
void rtsinus(scicos_block *, int );

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
scicos_block block_semwait[4];

  /* Real parameters declaration */
  /* Routine name of block: rtsinus
   * Gui name of block: rtai4_sinus
   * Compiled structure index: 4
   * Exprs: 1
   */
  static double rpar_4[]={1,1,0,0,0};

  /* Integers parameters declaration */
  /* Routine name of block: rtai_sem_wait
   * Gui name of block: rtai4_sem_wait
   * Compiled structure index: 1
   * Exprs: SEM1
   * ipar= {4,1,83,69,77,49,48};
   */
  static int ipar_1[]={4,1,83,69,77,49,48};

  /* Routine name of block: rtled
   * Gui name of block: rtai4_led
   * Compiled structure index: 2
   * Exprs: 1
   * ipar= {3,76,69,68};
   */
  static int ipar_2[]={3,76,69,68};

  /* Routine name of block: bidon
   * Gui name of block: EVTGEN_f
   * Compiled structure index: 5
   * Exprs: 1
   * ipar= {1};
   */
  static int ipar_5[]={1};



/* def real parameters */
double *RPAR[ ] = {
  rpar_4,
};

#ifdef linux
int NRPAR = 1;
int NTOTRPAR = 5;
char * strRPAR[1] = {"RPARAM[1]"};
int lenRPAR[1] = {5};
#endif

/* def integer parameters */
int *IPAR[ ] = {
  ipar_1,
  ipar_2,
  ipar_5,
};

#ifdef linux
int NIPAR = 3;
int NTOTIPAR = 12;
char * strIPAR[3] = {"IPARAM[1]","IPARAM[2]","IPARAM[3]"};
int lenIPAR[3] = {7,4,1};
#endif

  /* Object parameters declaration */
  /* Routine name of block: rtscope
   * Gui name of block: rtai4_scope
   * Compiled structure index: 3
   */
  __CONST__ unsigned char opar_1[]={83,67,79,80,69,0};
  __CONST__ unsigned char opar_2[]={49,0};

  __CONST__ int oparsz_3[]={1,1,6,2};

  __CONST__ int opartyp_3[]={SCSUINT8_N,SCSUINT8_N};

  static void *oparptr_3[]={0,0};

  /* Work array declaration */
  static void *work_1[]={0};
  static void *work_2[]={0};
  static void *work_3[]={0};
  static void *work_4[]={0};
  static void *work_5[]={0};

  /* Output declaration */
  static double outtb_1[]={0};
  static double outtb_2[]={0};

  /* Inputs */
  static int insz_2[]={1,1,SCSREAL_N};
  static int insz_3[]={1,1,SCSREAL_N};

  static void *inptr_2[]={0};
  static void *inptr_3[]={0};

  /* Outputs */
  static int outsz_1[]={1,1,SCSREAL_N};
  static int outsz_4[]={1,1,SCSREAL_N};

  static void *outptr_1[]={0};
  static void *outptr_4[]={0};


/*----------------------------------------  Initialisation function */
int semwait_init()
{
  double t;
  int local_flag;

  /* Affectation of inptr */
  inptr_2[0] = (void *) outtb_1;
  inptr_3[0] = (void *) outtb_2;

  /* Affectation of outptr */
  outptr_1[0] = (void *) outtb_1;
  outptr_4[0] = (void *) outtb_2;

  /* Affectation of oparptr */
  oparptr_3[0] = (void *) opar_1;
  oparptr_3[1] = (void *) opar_2;

  /* set blk struc. of 'rtai_sem_wait' (type 4 - blk nb 1) */
  block_semwait[0].type    = 4;
  block_semwait[0].ztyp    = 0;
  block_semwait[0].ng      = 0;
  block_semwait[0].nz      = 0;
  block_semwait[0].nx      = 0;
  block_semwait[0].noz     = 0;
  block_semwait[0].nrpar   = 0;
  block_semwait[0].nopar   = 0;
  block_semwait[0].nipar   = 7;
  block_semwait[0].nin     = 0;
  block_semwait[0].nout    = 1;
  block_semwait[0].nevout  = 0;
  block_semwait[0].nmode   = 0;
  block_semwait[0].outptr  = outptr_1;
  block_semwait[0].outsz   = outsz_1;
  block_semwait[0].ipar    = ipar_1;
  block_semwait[0].work    = work_1;

  /* set blk struc. of 'rtled' (type 4 - blk nb 2) */
  block_semwait[1].type    = 4;
  block_semwait[1].ztyp    = 0;
  block_semwait[1].ng      = 0;
  block_semwait[1].nz      = 0;
  block_semwait[1].nx      = 0;
  block_semwait[1].noz     = 0;
  block_semwait[1].nrpar   = 0;
  block_semwait[1].nopar   = 0;
  block_semwait[1].nipar   = 4;
  block_semwait[1].nin     = 1;
  block_semwait[1].nout    = 0;
  block_semwait[1].nevout  = 0;
  block_semwait[1].nmode   = 0;
  block_semwait[1].inptr   = inptr_2;
  block_semwait[1].insz    = insz_2;
  block_semwait[1].ipar    = ipar_2;
  block_semwait[1].work    = work_2;

  /* set blk struc. of 'rtscope' (type 4 - blk nb 3) */
  block_semwait[2].type    = 4;
  block_semwait[2].ztyp    = 0;
  block_semwait[2].ng      = 0;
  block_semwait[2].nz      = 0;
  block_semwait[2].nx      = 0;
  block_semwait[2].noz     = 0;
  block_semwait[2].nrpar   = 0;
  block_semwait[2].nopar   = 2;
  block_semwait[2].nipar   = 0;
  block_semwait[2].nin     = 1;
  block_semwait[2].nout    = 0;
  block_semwait[2].nevout  = 0;
  block_semwait[2].nmode   = 0;
  block_semwait[2].inptr   = inptr_3;
  block_semwait[2].insz    = insz_3;
  block_semwait[2].oparptr = oparptr_3;
  block_semwait[2].oparsz  = oparsz_3;
  block_semwait[2].opartyp = opartyp_3;
  block_semwait[2].work    = work_3;

  /* set blk struc. of 'rtsinus' (type 4 - blk nb 4) */
  block_semwait[3].type    = 4;
  block_semwait[3].ztyp    = 0;
  block_semwait[3].ng      = 0;
  block_semwait[3].nz      = 0;
  block_semwait[3].nx      = 0;
  block_semwait[3].noz     = 0;
  block_semwait[3].nrpar   = 5;
  block_semwait[3].nopar   = 0;
  block_semwait[3].nipar   = 0;
  block_semwait[3].nin     = 0;
  block_semwait[3].nout    = 1;
  block_semwait[3].nevout  = 0;
  block_semwait[3].nmode   = 0;
  block_semwait[3].outptr  = outptr_4;
  block_semwait[3].outsz   = outsz_4;
  block_semwait[3].rpar    = rpar_4;
  block_semwait[3].work    = work_4;

  /* set initial phase simulation */
  phase = 1;

  /* Initialization */

  /* Call of 'rtai_sem_wait' (type 4 - blk nb 1) */
  block_semwait[0].nevprt = 0;
  local_flag = 4;
  set_block_number(1);
  rtai_sem_wait(&block_semwait[0],local_flag);

  /* Call of 'rtled' (type 4 - blk nb 2) */
  block_semwait[1].nevprt = 0;
  local_flag = 4;
  set_block_number(2);
  rtled(&block_semwait[1],local_flag);

  /* Call of 'rtscope' (type 4 - blk nb 3) */
  block_semwait[2].nevprt = 0;
  local_flag = 4;
  set_block_number(3);
  rtscope(&block_semwait[2],local_flag);

  /* Call of 'rtsinus' (type 4 - blk nb 4) */
  block_semwait[3].nevprt = 0;
  local_flag = 4;
  set_block_number(4);
  rtsinus(&block_semwait[3],local_flag);
  return(local_flag);
}

/*----------------------------------------  ISR function */
int semwait_isr(double t)
{
  int local_flag;
  int i;
    /* Output computation */
    /* Discrete activations */
    /* Call of 'rtai_sem_wait' (type 4 - blk nb 1) */
    block_semwait[0].nevprt = 1;
    local_flag = 1;
    set_block_number(1);
    rtai_sem_wait(&block_semwait[0],local_flag);

    /* Call of 'rtled' (type 4 - blk nb 2) */
    block_semwait[1].nevprt = 1;
    local_flag = 1;
    set_block_number(2);
    rtled(&block_semwait[1],local_flag);

    /* Call of 'rtsinus' (type 4 - blk nb 4) */
    block_semwait[3].nevprt = 1;
    local_flag = 1;
    set_block_number(4);
    rtsinus(&block_semwait[3],local_flag);

    /* Call of 'rtscope' (type 4 - blk nb 3) */
    block_semwait[2].nevprt = 1;
    local_flag = 1;
    set_block_number(3);
    rtscope(&block_semwait[2],local_flag);




  return 0;
}
/*----------------------------------------  Termination function */
int semwait_end()
{
  double t;
  int local_flag;

  /* Ending */

  /* Call of 'rtai_sem_wait' (type 4 - blk nb 1) */
  block_semwait[0].nevprt = 0;
  local_flag = 5;
  set_block_number(1);
  rtai_sem_wait(&block_semwait[0],local_flag);

  /* Call of 'rtled' (type 4 - blk nb 2) */
  block_semwait[1].nevprt = 0;
  local_flag = 5;
  set_block_number(2);
  rtled(&block_semwait[1],local_flag);

  /* Call of 'rtscope' (type 4 - blk nb 3) */
  block_semwait[2].nevprt = 0;
  local_flag = 5;
  set_block_number(3);
  rtscope(&block_semwait[2],local_flag);

  /* Call of 'rtsinus' (type 4 - blk nb 4) */
  block_semwait[3].nevprt = 0;
  local_flag = 5;
  set_block_number(4);
  rtsinus(&block_semwait[3],local_flag);
  return 0;
}

