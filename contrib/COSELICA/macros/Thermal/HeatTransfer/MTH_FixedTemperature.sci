// Coselica Toolbox for Scicoslab
// Copyright (C) 2009, 2010  Dirk Reusch, Kybernetik Dr. Reusch
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.

function [x,y,typ]=MTH_FixedTemperature(job,arg1,arg2)
x=[];y=[];typ=[];
select job
  case 'plot' then
    T=arg1.graphics.exprs(1);
    standard_draw(arg1,%f,_MTH_FixedTemperature_dp);
  case 'getinputs' then
    [x,y,typ]=_MTH_FixedTemperature_ip(arg1);
  case 'getoutputs' then
    [x,y,typ]=_MTH_FixedTemperature_op(arg1);
  case 'getorigin' then
    [x,y]=standard_origin(arg1);
  case 'set' then
    x=arg1;
    graphics=arg1.graphics;exprs=graphics.exprs;
    model=arg1.model;
    while %t do
      [ok,T,exprs]=...
        getvalue(['';'MTH_FixedTemperature';'';'Fixed temperature boundary condition in Kelvin';''],...
        [' T [K] : Fixed temperature at port'],...
        list('vec',1),exprs);
      if ~ok then break, end
      model.equations.parameters(2)=list(T)
      graphics.exprs=exprs;
      x.graphics=graphics;x.model=model;
      break
    end
  case 'define' then
    model=scicos_model();
    T=1;
    model.sim='Coselica';
    model.blocktype='c';
    model.dep_ut=[%t %f];
    mo=modelica();
      mo.model='Modelica.Thermal.HeatTransfer.FixedTemperature';
      mo.inputs=[];
      mo.outputs=['port'];
      mo.parameters=list(['T'],...
                         list(T),...
                         [0]);
    model.equations=mo;
    model.in=ones(size(mo.inputs,'*'),1);
    model.out=ones(size(mo.outputs,'*'),1);
    exprs=[sci2exp(T)];
    gr_i=[...
          'if orient then';...
          '  xx=orig(1);yy=orig(2);';...
          '  ww=sz(1);hh=sz(2);';...
          'else';...
          '  xx=orig(1)+sz(1);yy=orig(2);';...
          '  ww=-sz(1);hh=sz(2);';...
          'end';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.105,orig(2)+sz(2)*1.01,""""+model.label+"""",sz(1)*1.2,sz(2)*0.3,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.105-1.2),orig(2)+sz(2)*1.01,""""+model.label+"""",sz(1)*1.2,sz(2)*0.3,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,255);';...
          'e.font_foreground=color(0,0,255);';...
          'e.fill_mode=""on"";';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.105,orig(2)+sz(2)*-0.255,""T=""+string(T)+"""",sz(1)*1.2,sz(2)*0.23,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.105-1.2),orig(2)+sz(2)*-0.255,""T=""+string(T)+"""",sz(1)*1.2,sz(2)*0.23,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.font_foreground=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'if orient then';...
          '  xrect(orig(1)+sz(1)*0,orig(2)+sz(2)*1,sz(1)*1,sz(2)*1);';...
          'else';...
          '  xrect(orig(1)+sz(1)*(1-0-1),orig(2)+sz(2)*1,sz(1)*1,sz(2)*1);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(159,159,223);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=0;';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*0,orig(2)+sz(2)*0,""K"",sz(1)*0.5,sz(2)*0.5,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1-0-0.5),orig(2)+sz(2)*0,""K"",sz(1)*0.5,sz(2)*0.5,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.font_foreground=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'xpoly(xx+ww*[0.24;0.78],yy+hh*[0.5;0.5]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(191,0,0);';...
          'e.thickness=0.5;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.75;0.75;0.95;0.75],yy+hh*[0.4;0.6;0.5;0.4]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(191,0,0);';...
          'e.background=color(191,0,0);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
         ];

    x=standard_define([2 2],model,exprs,list(gr_i,0));
    x.graphics.in_implicit=[];
    x.graphics.out_implicit=['I'];
  end
endfunction
