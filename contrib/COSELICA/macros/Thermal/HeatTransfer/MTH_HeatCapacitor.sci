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

function [x,y,typ]=MTH_HeatCapacitor(job,arg1,arg2)
x=[];y=[];typ=[];
select job
  case 'plot' then
    C=arg1.graphics.exprs(1);
    steadyStateStart=arg1.graphics.exprs(2);
    T_start=arg1.graphics.exprs(3);
    standard_draw(arg1,%f,_MTH_HeatCapacitor_dp);
  case 'getinputs' then
    [x,y,typ]=_MTH_HeatCapacitor_ip(arg1);
  case 'getoutputs' then
    [x,y,typ]=_MTH_HeatCapacitor_op(arg1);
  case 'getorigin' then
    [x,y]=standard_origin(arg1);
  case 'set' then
    x=arg1;
    graphics=arg1.graphics;exprs=graphics.exprs;
    model=arg1.model;
    while %t do
      [ok,C,steadyStateStart,T_start,exprs]=...
        getvalue(['';'MTH_HeatCapacitor';'';'Lumped thermal element storing heat';''],...
        [' C [J/K] : Heat capacity of part (= cp*m)',' steadyStateStart [-] : true, if component shall start in steady state',' T_start [K] : Initial temperature of part (in Kelvin)'],...
        list('vec',1,'vec',1,'vec',1),exprs);
      if ~ok then break, end
      model.equations.parameters(2)=list(C,steadyStateStart,T_start)
      graphics.exprs=exprs;
      x.graphics=graphics;x.model=model;
      break
    end
  case 'define' then
    model=scicos_model();
    C=1;
    steadyStateStart=0;
    T_start=293.15;
    model.sim='Coselica';
    model.blocktype='c';
    model.dep_ut=[%t %f];
    mo=modelica();
      mo.model='Modelica.Thermal.HeatTransfer.HeatCapacitor';
      mo.inputs=[];
      mo.outputs=['port'];
      mo.parameters=list(['C','steadyStateStart','T_start'],...
                         list(C,steadyStateStart,T_start),...
                         [0,0,0]);
    model.equations=mo;
    model.in=ones(size(mo.inputs,'*'),1);
    model.out=ones(size(mo.outputs,'*'),1);
    exprs=[sci2exp(C);sci2exp(steadyStateStart);sci2exp(T_start)];
    gr_i=[...
          'if orient then';...
          '  xx=orig(1);yy=orig(2);';...
          '  ww=sz(1);hh=sz(2);';...
          'else';...
          '  xx=orig(1)+sz(1);yy=orig(2);';...
          '  ww=-sz(1);hh=sz(2);';...
          'end';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*-0.145,orig(2)+sz(2)*0.85,""""+model.label+"""",sz(1)*1.3,sz(2)*0.255,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1--0.145-1.3),orig(2)+sz(2)*0.85,""""+model.label+"""",sz(1)*1.3,sz(2)*0.255,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,255);';...
          'e.font_foreground=color(0,0,255);';...
          'e.fill_mode=""on"";';...
          'xpoly(xx+ww*[0.5;0.4;0.3;0.24;0.21;0.16;0.14;0.12;0.11;0.12;0.12;0.12;0.15;0.18;0.26;0.35;0.41;0.49;0.54;0.61;0.66;0.71;0.77;0.78;0.83;0.84;0.85;0.86;0.88;0.89;0.89;0.87;0.83;0.77;0.72;0.68;0.63;0.5],yy+hh*[0.835;0.815;0.785;0.715;0.675;0.625;0.565;0.495;0.425;0.345;0.285;0.235;0.175;0.135;0.115;0.085;0.085;0.075;0.055;0.055;0.065;0.095;0.125;0.135;0.195;0.235;0.245;0.325;0.395;0.435;0.515;0.575;0.625;0.665;0.705;0.785;0.825;0.835]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(160,160,160);';...
          'e.background=color(192,192,192);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'xpoly(xx+ww*[0.21;0.16;0.14;0.12;0.11;0.12;0.12;0.12;0.15;0.18;0.26;0.35;0.41;0.49;0.54;0.61;0.66;0.71;0.77;0.71;0.7;0.65;0.6;0.59;0.55;0.51;0.44;0.39;0.35;0.3;0.25;0.22;0.21;0.21;0.2;0.2;0.2;0.21;0.22;0.24;0.26;0.28;0.3;0.21],yy+hh*[0.675;0.625;0.565;0.495;0.425;0.345;0.285;0.235;0.175;0.135;0.115;0.085;0.085;0.075;0.055;0.055;0.065;0.095;0.125;0.115;0.115;0.105;0.095;0.095;0.095;0.115;0.135;0.135;0.145;0.175;0.225;0.285;0.325;0.375;0.435;0.475;0.535;0.585;0.595;0.635;0.675;0.725;0.785;0.675]);';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,0);';...
          'e.background=color(160,160,160);';...
          'e.fill_mode=""on"";';...
          'e.thickness=0.25;';...
          'e.line_style=1;';...
          'if orient then';...
          '  xstringb(orig(1)+sz(1)*0.155,orig(2)+sz(2)*0.38,""""+string(C)+"""",sz(1)*0.7,sz(2)*0.155,""fill"");';...
          'else';...
          '  xstringb(orig(1)+sz(1)*(1-0.155-0.7),orig(2)+sz(2)*0.38,""""+string(C)+"""",sz(1)*0.7,sz(2)*0.155,""fill"");';...
          'end';...
          'e=gce();';...
          'e.visible=""on"";';...
          'e.foreground=color(0,0,255);';...
          'e.background=color(0,0,0);';...
          'e.font_foreground=color(0,0,0);';...
          'e.fill_mode=""off"";';...
         ];

    x=standard_define([2 2],model,exprs,list(gr_i,0));
    x.graphics.in_implicit=[];
    x.graphics.out_implicit=['I'];
  end
endfunction
