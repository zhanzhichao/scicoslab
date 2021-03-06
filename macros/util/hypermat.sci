function M=hypermat(dims,v)
// Copyright INRIA
//initialize an hypermatrix whose dimensions are given in the vector dims
// all entries are set to 0
//
// M data structure contains the vector of matrix dimensions M('dims')
// and the vector of entries M('entries') such as the leftmost subcripts vary first
// [M(1,1,..);..;M(n1,1,..);...;M(1,n2,..);..;M(n1,n2,..);...]
  [lhs,rhs]=argn(0)
  dims=double(dims)
  if or(floor(dims)<>dims)|or(dims<0) then
    error("Wrong values for input argument: Elements must be non negative integers");
  end
  if  dims==[]|or(dims==0) then dims=[0 0],end

  if size(dims,'*')==1 then
    dims=[1 dims],
  else
    //remove last dimensions equal to 1
    nd=size(dims,'*')
    while nd>2&dims(nd)==1 then nd=nd-1,end
    dims=dims(1:nd)
  end

  if argn(2)<2 then v=zeros(prod(dims),1),end
  if size(v,'*')<> double(prod(dims)) then
    error('Number of entries does not match product of dimensions');
  end
  if size(dims,'*')==2 then
    M=matrix(v,dims)
  else
    M=mlist(['hm','dims','entries'],int32(matrix(dims,1,-1)),matrix(v,-1,1))
  end
endfunction
