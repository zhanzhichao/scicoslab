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

function [x,y,typ]=CBN_RateLimiter(job,arg1,arg2)
x=[];y=[];typ=[];
select job
  case 'plot' then
    sMax=arg1.graphics.exprs(1);
    sMin=arg1.graphics.exprs(2);
    T=arg1.graphics.exprs(3);
    y_start=arg1.graphics.exprs(4);
    standard_draw(arg1,%f,_MBI_SISO_dp);
  case 'getinputs' then
    [x,y,typ]=_MBI_SISO_ip(arg1);
  case 'getoutputs' then
    [x,y,typ]=_MBI_SISO_op(arg1);
  case 'getorigin' then
    [x,y]=standard_origin(arg1);
  case 'set' then
    x=arg1;
    graphics=arg1.graphics;exprs=graphics.exprs;
    model=arg1.model;
    while %t do
      [ok,sMax,sMin,T,y_start,exprs]=...
        getvalue(['';'CBN_RateLimiter';'';'Limit rate of change of signal';''],...
        [' sMax [-] : Maximum slope',' sMin [-] : Minimum slope',' T [s] : Time constant (> 0)',' y_start [-] : Start value of output'],...
        list('vec',1,'vec',1,'vec',1,'vec',1),exprs);
      if ~ok then break, end
      model.equations.parameters(2)=list(sMax,sMin,T,y_start)
      graphics.exprs=exprs;
      x.graphics=graphics;x.model=model;
      break
    end
  case 'define' then
    model=scicos_model();
    sMax=1;
    sMin=-1;
    T=0.0001;
    y_start=0;
    model.sim='Coselica';
    model.blocktype='c';
    model.dep_ut=[%t %f];
    mo=modelica();
      mo.model='Coselica.Blocks.Nonlinear.RateLimiter';
      mo.inputs=['u'];
      mo.outputs=['y'];
      mo.parameters=list(['sMax','sMin','T','y_start'],...
                         list(sMax,sMin,T,y_start),...
                         [0,0,0,0]);
    model.equations=mo;
    model.in=ones(size(mo.inputs,'*'),1);
    model.out=ones(size(mo.outputs,'*'),1);
    exprs=[sci2exp(sMax);sci2exp(sMin);sci2exp(T);sci2exp(y_start)];
    gr_i=[...
          'if orient then';...
          '  xx=orig(1);yy=orig(2);';...
          '  ww=sz(1);hh=sz(2);';...
          'else';...
          '  xx=orig(1)+sz(1);yy=orig(2);';...
          '  ww=-sz(1);hh=sz(2);';...
          'end';...
          'if orient then';...
          '  xrect(orig(1)+sz(1)*0,orig(2)+sz(2)*1,sz(1)*1,sz(2)*1);';...
          'else';...
          '  xrect(orig(1)+sz(1)*(1-0-1),orig(2)+sz(2)*1,sz(1)*1,sz(2)*1);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,191);';...
          'e.background=color(255,255,255);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.25,orig(2)+sz(2)*1.05,""""+model.label+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.25-1.5),orig(2)+sz(2)*1.05,""""+model.label+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(0,0,255);';...
          'e.font_foreground=color(0,0,255);';...
          'e.fill_mode=""off"";';...
          'xpoly(xx+ww*[0.5;0.5],yy+hh*[0.05;0.84]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(192,192,192);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.5;0.46;0.54;0.5],yy+hh*[0.95;0.84;0.84;0.95]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(192,192,192);';...
          'e.background=color(192,192,192);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.05;0.84],yy+hh*[0.5;0.5]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(192,192,192);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.95;0.84;0.84;0.95],yy+hh*[0.5;0.46;0.54;0.5]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(192,192,192);';...
          'e.background=color(192,192,192);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.25;0.75],yy+hh*[0.15;0.85]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.25,orig(2)+sz(2)*-0.25,""sMax=""+string(sMax)+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.25-1.5),orig(2)+sz(2)*-0.25,""sMax=""+string(sMax)+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(0,0,0);';...
          'e.font_foreground=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.25,orig(2)+sz(2)*1.05,""""+model.label+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.25-1.5),orig(2)+sz(2)*1.05,""""+model.label+"""",sz(1)*1.5,sz(2)*0.2,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(0,0,0);';...
          'e.font_foreground=color(0,0,0);';...
          'e.fill_mode=""off"";';...
         ];

    x=standard_define([2 2],model,exprs,list(gr_i,0));
    x.graphics.in_implicit=['E'];
    x.graphics.out_implicit=['E'];
  end
endfunction