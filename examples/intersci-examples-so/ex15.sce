// Example ex15
//[1] call intersci with Makefile 
//
V=G_make('ex15fi.c','ex15fi.c');
//[2] run the builder generated by intersci.
//    Since files and libs were nor transmited 
//    to intersci we give them here 
files = ['ex15fi.o';'ex15c.o'];
libs  = [] ;
exec ex15fi_builder.sce 

//[3] run the loader to load the interface 
//    Note that the file loader.sce 
//    is changed each time you run a demo 
//    if several .desc are present in a directory
exec loader.sce; 

//[4] test the loaded function 
a=[0,0,1.23;0,2.32,0;3.45,0,0];

// simple matrix argument 

b=mat1(a);
if norm(b- a) > %eps then pause,end

// matrix argument + conversion to int 

b=mat2(a);
if norm(b- int(a)) > %eps then pause,end

// matrix and return a matrix in a list 

b=mat3(a);
if norm(b(1)- a) > %eps then pause,end

// new matrix in intersci 

b=mat4(a);
if norm(b- 2*a) > %eps then pause,end

// new matrix + conversion to int

b=mat5(a);
if norm(b- int(2*a)) > %eps then pause,end

// new matrix returned in a list 

b=mat6(a);
if norm(b(1)- 2*a) > %eps then pause,end

// list argument with a matrix  

b=mat7(list(a));
if norm(b- a) > %eps then pause,end

// list argument + conversion 

b=mat8(list(a));
if norm(b- int(a)) > %eps then pause,end

// list argument + list output 

b=mat9(list(a));
if norm(b(1)- a) > %eps then pause,end

// cintf 

b=mat10();
if norm(b'- (0:9)) > %eps then pause,end

// cintf + list 

b=mat11();
if norm(b(1)'- (0:9)) > %eps then pause,end










