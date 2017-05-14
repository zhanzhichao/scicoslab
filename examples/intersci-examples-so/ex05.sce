// Example ex05
//[1] call intersci with Makefile 
//
V=G_make('ex05fi.c','ex05fi.c');
//[2] run the builder generated by intersci.
//    Since files and libs were nor transmited 
//    to intersci we give them here 
files = ['ex05fi.o';'ex05f.o'];
libs  = [] ;
exec ex05fi_builder.sce 

//[3] run the loader to load the interface 
//    Note that the file loader.sce 
//    is changed each time you run a demo 
//    if several .desc are present in a directory
exec loader.sce; 



//[4] test the loaded function 

a=1:5;b=-a;c=ones(3,3);

deff('[y]=f(i,j)','y=i+j');
Ref=feval(1:3,1:3,f)


[a1,b1,c1,d1]=foobar('mul',a,b,c);

if norm(a1-2*a) > %eps then pause,end
if norm(b1-2*b) > %eps then pause,end
if norm(c1-2*c) > %eps then pause,end
if norm(d1-(Ref.*c1))> %eps then pause,end

[a1,b1,c1,d1]=foobar('add',a,b,c);

if norm(a1-(2+a)) > %eps then pause,end
if norm(b1-(2+b)) > %eps then pause,end
if norm(c1-(2+c)) > %eps then pause,end
if norm(d1-(Ref+c1))> %eps then pause,end
