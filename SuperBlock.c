/* Code prototype for standalone use  */
/*     Generated by Code_Generation toolbox of Scicos with scicos4.4 */
/*     date : 21-Apr-2017 */

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

double SuperBlock_get_tsamp()
{
  return(0.1);
}

double SuperBlock_get_tsamp_delay()
{
  return(0.1);
}

/* ---- Clock code ---- */
int SuperBlock_useInternTimer(void) {
 return 1;
}

void rtextclk(void) { }

/* ---- Internals functions declaration ---- */
int SuperBlock_init(void);
int SuperBlock_isr(double);
int SuperBlock_end(void);

/* prototype of 'rtsinus' (type 4) */
void rtsinus(scicos_block *, int );

/* prototype of 'rtscope' (type 4) */
void rtscope(scicos_block *, int );

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
scicos_block block_SuperBlock[2];

  /* Real parameters declaration */
  /* Routine name of block: rtsinus
   * Gui name of block: rtai4_sinus
   * Compiled structure index: 1
   * Exprs: 1
   */
  static double rpar_1[]={1,1,0,0,0};

  /* Integers parameters declaration */
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
  ipar_3,
};

#ifdef linux
int NIPAR = 1;
int NTOTIPAR = 1;
char * strIPAR[1] = {"IPARAM[1]"};
int lenIPAR[1] = {1};
#endif

  /* Object parameters declaration */
  /* Routine name of block: rtscope
   * Gui name of block: rtai4_scope
   * Compiled structure index: 2
   */
  __CONST__ unsigned char opar_1[]={83,67,79,80,69,0};
  __CONST__ unsigned char opar_2[]={49,0};

  __CONST__ int oparsz_2[]={1,1,6,2};

  __CONST__ int opartyp_2[]={SCSUINT8_N,SCSUINT8_N};

  static void *oparptr_2[]={0,0};

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
int SuperBlock_init()
{
  double t;
  int local_flag;

  /* Affectation of inptr */
  inptr_2[0] = (void *) outtb_1;

  /* Affectation of outptr */
  outptr_1[0] = (void *) outtb_1;

  /* Affectation of oparptr */
  oparptr_2[0] = (void *) opar_1;
  oparptr_2[1] = (void *) opar_2;

  /* set blk struc. of 'rtsinus' (type 4 - blk nb 1) */
  block_SuperBlock[0].type    = 4;
  block_SuperBlock[0].ztyp    = 0;
  block_SuperBlock[0].ng      = 0;
  block_SuperBlock[0].nz      = 0;
  block_SuperBlock[0].nx      = 0;
  block_SuperBlock[0].noz     = 0;
  block_SuperBlock[0].nrpar   = 5;
  block_SuperBlock[0].nopar   = 0;
  block_SuperBlock[0].nipar   = 0;
  block_SuperBlock[0].nin     = 0;
  block_SuperBlock[0].nout    = 1;
  block_SuperBlock[0].nevout  = 0;
  block_SuperBlock[0].nmode   = 0;
  block_SuperBlock[0].outptr  = outptr_1;
  block_SuperBlock[0].outsz   = outsz_1;
  block_SuperBlock[0].rpar    = rpar_1;
  block_SuperBlock[0].work    = work_1;

  /* set blk struc. of 'rtscope' (type 4 - blk nb 2) */
  block_SuperBlock[1].type    = 4;
  block_SuperBlock[1].ztyp    = 0;
  block_SuperBlock[1].ng      = 0;
  block_SuperBlock[1].nz      = 0;
  block_SuperBlock[1].nx      = 0;
  block_SuperBlock[1].noz     = 0;
  block_SuperBlock[1].nrpar   = 0;
  block_SuperBlock[1].nopar   = 2;
  block_SuperBlock[1].nipar   = 0;
  block_SuperBlock[1].nin     = 1;
  block_SuperBlock[1].nout    = 0;
  block_SuperBlock[1].nevout  = 0;
  block_SuperBlock[1].nmode   = 0;
  block_SuperBlock[1].inptr   = inptr_2;
  block_SuperBlock[1].insz    = insz_2;
  block_SuperBlock[1].oparptr = oparptr_2;
  block_SuperBlock[1].oparsz  = oparsz_2;
  block_SuperBlock[1].opartyp = opartyp_2;
  block_SuperBlock[1].work    = work_2;

  /* set initial phase simulation */
  phase = 1;

  /* Initialization */

  /* Call of 'rtsinus' (type 4 - blk nb 1) */
  block_SuperBlock[0].nevprt = 0;
  local_flag = 4;
  set_block_number(1);
  rtsinus(&block_SuperBlock[0],local_flag);

  /* Call of 'rtscope' (type 4 - blk nb 2) */
  block_SuperBlock[1].nevprt = 0;
  local_flag = 4;
  set_block_number(2);
  rtscope(&block_SuperBlock[1],local_flag);
  return(local_flag);
}

/*----------------------------------------  ISR function */
int SuperBlock_isr(double t)
{
  int local_flag;
  int i;
    /* Output computation */
    /* Discrete activations */
    /* Call of 'rtsinus' (type 4 - blk nb 1) */
    block_SuperBlock[0].nevprt = 1;
    local_flag = 1;
    set_block_number(1);
    rtsinus(&block_SuperBlock[0],local_flag);

    /* Call of 'rtscope' (type 4 - blk nb 2) */
    block_SuperBlock[1].nevprt = 1;
    local_flag = 1;
    set_block_number(2);
    rtscope(&block_SuperBlock[1],local_flag);




  return 0;
}
/*----------------------------------------  Termination function */
int SuperBlock_end()
{
  double t;
  int local_flag;

  /* Ending */

  /* Call of 'rtsinus' (type 4 - blk nb 1) */
  block_SuperBlock[0].nevprt = 0;
  local_flag = 5;
  set_block_number(1);
  rtsinus(&block_SuperBlock[0],local_flag);

  /* Call of 'rtscope' (type 4 - blk nb 2) */
  block_SuperBlock[1].nevprt = 0;
  local_flag = 5;
  set_block_number(2);
  rtscope(&block_SuperBlock[1],local_flag);
  return 0;
}
