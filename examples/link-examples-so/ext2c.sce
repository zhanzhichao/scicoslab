// Demo file for ext2c example 

// builder code for ext2c.c 
link_name = 'ext2c';    // functions to be added to the call table 
flag  = "c";		// ext2c is a C function 
files = ['ext2c.o' ];   // objects files for ext2c 
libs  = [];		// other libs needed for linking 

// the next call generates files (Makelib,loader.sce) used
// for compiling and loading ext2c and performs the compilation

ilib_for_link(link_name,files,libs,flag);

// load new function code in the scope of call 
// using the previously generated loader 
exec loader.sce; 

// test new function through the call function 

a=[1,2,3];b=[4,5,6];n=3;
c=call('ext2c',n,1,'i',a,2,'d',b,3,'d','out',[1,3],4,'d');
if norm(c-(sin(a)+cos(b))) > %eps then pause,end
