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

function [x,y,typ]=MEAI_IdealTransformer(job,arg1,arg2)
x=[];y=[];typ=[];
select job
  case 'plot' then
    n=arg1.graphics.exprs(1);
    standard_draw(arg1,%f,_MEAI_TwoPort_dp);
  case 'getinputs' then
    [x,y,typ]=_MEAI_TwoPort_ip(arg1);
  case 'getoutputs' then
    [x,y,typ]=_MEAI_TwoPort_op(arg1);
  case 'getorigin' then
    [x,y]=standard_origin(arg1);
  case 'set' then
    x=arg1;
    graphics=arg1.graphics;exprs=graphics.exprs;
    model=arg1.model;
    while %t do
      [ok,n,exprs]=...
        getvalue(['';'MEAI_IdealTransformer';'';'Ideal electrical transformer';''],...
        [' n [-] : Turns ratio'],...
        list('vec',1),exprs);
      if ~ok then break, end
      model.equations.parameters(2)=list(n)
      graphics.exprs=exprs;
      x.graphics=graphics;x.model=model;
      break
    end
  case 'define' then
    model=scicos_model();
    n=1;
    model.sim='Coselica';
    model.blocktype='c';
    model.dep_ut=[%t %f];
    mo=modelica();
      mo.model='Modelica.Electrical.Analog.Ideal.IdealTransformer';
      mo.inputs=['p1','n1'];
      mo.outputs=['p2','n2'];
      mo.parameters=list(['n'],...
                         list(n),...
                         [0]);
    model.equations=mo;
    model.in=ones(size(mo.inputs,'*'),1);
    model.out=ones(size(mo.outputs,'*'),1);
    exprs=[sci2exp(n)];
    gr_i=[...
          'if orient then';...
          '  xx=orig(1);yy=orig(2);';...
          '  ww=sz(1);hh=sz(2);';...
          'else';...
          '  xx=orig(1)+sz(1);yy=orig(2);';...
          '  ww=-sz(1);hh=sz(2);';...
          'end';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*0,orig(2)+sz(2)*0.9,""""+model.label+"""",sz(1)*1,sz(2)*0.1,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1-0-1),orig(2)+sz(2)*0.9,""""+model.label+"""",sz(1)*1,sz(2)*0.1,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(0,0,255);';...
          'e.font_foreground=color(0,0,255);';...
          'e.fill_mode=""off"";';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.275,orig(2)+sz(2)*0.375,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.275-0.125),orig(2)+sz(2)*0.375,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.275,orig(2)+sz(2)*0.5,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.275-0.125),orig(2)+sz(2)*0.5,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.275,orig(2)+sz(2)*0.625,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.275-0.125),orig(2)+sz(2)*0.625,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.275,orig(2)+sz(2)*0.75,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.275-0.125),orig(2)+sz(2)*0.75,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xrect(orig(1)+sz(1)*0.14,orig(2)+sz(2)*0.8,sz(1)*0.195,sz(2)*0.6);';...
          'else';...
          '  xrect(orig(1)+sz(1)*(1-0.14-0.195),orig(2)+sz(2)*0.8,sz(1)*0.195,sz(2)*0.6);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(255,255,255);';...
          'e.background=color(255,255,255);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.05;0.34],yy+hh*[0.75;0.75]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.05;0.34],yy+hh*[0.25;0.25]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.6,orig(2)+sz(2)*0.375,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.6-0.125),orig(2)+sz(2)*0.375,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.6,orig(2)+sz(2)*0.5,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.6-0.125),orig(2)+sz(2)*0.5,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.6,orig(2)+sz(2)*0.625,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.6-0.125),orig(2)+sz(2)*0.625,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xarc(orig(1)+sz(1)*0.6,orig(2)+sz(2)*0.75,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'else';...
          '  xarc(orig(1)+sz(1)*(1-0.6-0.125),orig(2)+sz(2)*0.75,sz(1)*0.125,sz(2)*0.125,0,360*64);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.fill_mode=""off"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xrect(orig(1)+sz(1)*0.665,orig(2)+sz(2)*0.8,sz(1)*0.195,sz(2)*0.6);';...
          'else';...
          '  xrect(orig(1)+sz(1)*(1-0.665-0.195),orig(2)+sz(2)*0.8,sz(1)*0.195,sz(2)*0.6);';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(255,255,255);';...
          'e.background=color(255,255,255);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.66;0.95],yy+hh*[0.75;0.75]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.66;0.95],yy+hh*[0.25;0.25]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*0,orig(2)+sz(2)*0,""n=""+string(n)+"""",sz(1)*1,sz(2)*0.1,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1-0-1),orig(2)+sz(2)*0,""n=""+string(n)+"""",sz(1)*1,sz(2)*0.1,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(0,0,255);';...
          'e.font_foreground=color(0,0,255);';...
          'e.fill_mode=""off"";';...
         ];

    x=standard_define([2 2],model,exprs,list(gr_i,0));
    x.graphics.in_implicit=['I','I'];
    x.graphics.out_implicit=['I','I'];
  end
endfunction
