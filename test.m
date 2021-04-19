clc; clear; close all;

t = -6:0.1:0;
for i = 1:length(t)
    P = [t(i); exp(-t(i)) + exp(5*t(i)); 0];
    plot(P(1),P(2),'*r'); hold on; grid on; drawnow;
end
