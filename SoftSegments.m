clc; clear; close all;

NumSeg = 3;
Pinit = [0;0;0;1];
Length = [1;1;1;1];
Theta = [pi/6;pi/6;pi/6];
Th_prev = 0;

for n =1:NumSeg
   Th = Theta(n); 
   L = Length(n);
   Pend = PlotSoft(Pinit,Th,L);
   Pinit = Pend;
end