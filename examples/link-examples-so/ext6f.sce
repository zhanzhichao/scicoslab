// Demo file for ext6f example 

// builder code for ext6f.c 
link_name = 'ext6f';    // functions to be added to the call table 
flag  = "f";		// ext6f is a C function 
files = ['ext6f.o' ];   // objects files for ext6f 
libs  = [];		// other libs needed for linking 

// the next call generates files (Makelib,loader.sce) used
// for compiling and loading ext6f and performs the compilation

ilib_for_link(link_name,files,libs,flag);

// load new function code in the scope of call 
// using the previously generated loader 
exec loader.sce; 

// test new function through the call function 
//reading  vector with name='a' in scilab internal stack

a=[1,2,3];b=[2,3,4];
c=call('ext6f','a',1,'c',b,2,'d','out',[1,3],3,'d');
if norm(c-(a+2*b)) > %eps then pause,end

