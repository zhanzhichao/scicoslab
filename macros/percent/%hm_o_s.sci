function M=%hm_o_s(M,s)
// Copyright INRIA
//M==s
if size(s,'*')<> 1 then
  M=%f
  return
end
M('entries')=M('entries')==s
endfunction
