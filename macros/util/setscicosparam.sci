function [ok]=setscicosparam(dt,fic)
// setscicosparam : write binary data in rdnom_params.dat
// file generated by Scicos CodeGeneration.
//
// input : dt : a list that encloses the name and the values
//         of the scicos variables to be written in the parameters
//         file
//
//         fic : path+name of the data file
//
// output : ok : a flag to say if the operation is succesfull

   ok=%f;

   if typeof(dt)<>'SicosParam' then
     error('Type of data list doesn''t match.');
   end

   if fileinfo(fic)==[] then
     error('File doesn''t exists.');
   end

   [path,fname,extension]=fileparts(fic)
   fic_xml=path+fname+'.xml';

   if fileinfo(fic_xml)==[] then
     error('Xml file doesn''t exists.');
   end

   [dt_old,data]=getscicosparam(fic);

   if lstsize(dt)<>lstsize(dt_old) then
     error('Bad size for data list.');
   end

   for i=2:lstsize(dt)
     if dt(1)(i)<>dt_old(1)(i) then
       error('Bad name for component of data list : '+dt(1)(i)+'.');
     end
     if ~isequal(size(dt(i)),size(dt_old(i))) then
       error('Bad size for component of data list : '+dt(1)(i)+'. Must be '+sci2exp(size(dt_old(i)))+'.');
     end
     if ~isequal(typeof(dt(i)),typeof(dt_old(i))) then
       error('Bad type for component of data list : '+dt(1)(i)+'. Must be '+typeof(dt_old(i))+'.');
     end
   end

   fd=mopen(fic,'wb');

   for i=2:lstsize(dt)
     select evstr(data(i-1,4))
       case 10 then typ='dl';
       case 11 then typ='dl';
       case 84 then typ='ll';
       case 82 then typ='sl';
       case 81 then typ='cl';
       case 814 then typ='ull';
       case 812 then typ='usl';
       case 811 then typ='ucl';
     end
     mput(dt(i),typ,fd)
   end

   mclose(fd);
   ok=%t

endfunction