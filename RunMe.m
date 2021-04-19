clc; clear; close all;

% 3-segment
th = 0.01;
dt = 0.1;
k = 0.2;
t = 0;
P1 = [0.3;0.6;0];
P2 = [0.4;0.5;0];
P3 = [-0.5;0.4;0];
P4 = [-0.6;0.4;0];
P5 = [0.5;0.3;0];
P6 = [0.6;0.7;0];
P7 = [-0.7;0.6;0];
P8 = [-0.8;0.5;0];
P9 = [-0.7;0.5;0];
P10 =[-1;0.8;0];

Pe = [-1.5;5.3;0];
Pt = [6;7;0];
E = Pe - Pt;
Po = [0;0;0];

% idx = 0;
% nrun = 2;
% while idx < nrun
    
while norm(E) > th
    clf;
    t = t + dt;
    P1 = P1 + (-P1 + P2)*dt;
    P2 = P2 + (+P1 -2*P2 + P3)*dt;
    P3 = P3 + (+P2 -2*P3 + P4)*dt;
    P4 = P4 + (+P3 -2*P4 + P5)*dt;
    P5 = P5 + (+P4 -2*P5 + P6)*dt;
    P6 = P6 + (+P5 -2*P6 + P7)*dt;
    P7 = P7 + (+P6 -2*P7 + P8)*dt;
    P8 = P8 + (+P7 -2*P8 + P9)*dt;
    P9 = P9 + (+P8 -2*P9 + P10)*dt;
    P10= P10+ (+P9 -P10 - k*E)*dt;
    Pe = P1+P2+P3+P4+P5+P6+P7+P8+P9+P10;
    %
    E = Pe - Pt;
    %     figure(1);
    %     plot(t,norm(E),'*b'); hold on; grid on;
    %     drawnow; axis equal;

    P1G = P1;
    P2G = P1 + P2;
    P3G = P1 + P2 + P3;
    P4G = P1 + P2 + P3 + P4;
    P5G = P1 + P2 + P3 + P4 + P5;
    P6G = P1 + P2 + P3 + P4 + P5 + P6;
    P7G = P1 + P2 + P3 + P4 + P5 + P6 + P7;
    P8G = P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8;
    P9G = P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9;
    P10G = P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10;
    
    
%     plot(Po(1), Po(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P1G(1),P1G(2),'ok','LineWidth',3); hold on; grid on;    
%     plot(P2G(2),P2G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P3G(2),P3G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P4G(2),P4G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P5G(2),P5G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P6G(2),P6G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P7G(2),P7G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P8G(2),P8G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P9G(2),P9G(2),'ok','LineWidth',3); hold on; grid on;
%     plot(P10G(2),P10G(2),'ok','LineWidth',3); hold on; grid on;
    
    
    line([Po(1) P1(1)],[Po(2) P1(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P1G(1) P2G(1)],[P1G(2) P2G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P2G(1) P3G(1)],[P2G(2) P3G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P3G(1) P4G(1)],[P3G(2) P4G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P4G(1) P5G(1)],[P4G(2) P5G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P5G(1) P6G(1)],[P5G(2) P6G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P6G(1) P7G(1)],[P6G(2) P7G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P7G(1) P8G(1)],[P7G(2) P8G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P8G(1) P9G(1)],[P8G(2) P9G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    line([P9G(1) P10G(1)],[P9G(2) P10G(2)],'Color','blue','LineWidth',2); hold on; axis equal;
    
    
    axis([-10 10 0 10]);
    grid on; drawnow;
    
    % P1G = P1; P2G = P1+P2; P3G = P1+P2+P3;
    
end
% idx = idx + 1;
% end