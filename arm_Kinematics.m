function [P,T,th,Pend] = arm_Kinematics(kappa,s,th,phi,Pinit)

% Robot Forward Kinematic  >> Integral Representation (Modal App.)
    K = pi/2 - phi; 
    T = pi/2 - kappa*s;
    t0 = [0 ; 0 ; 1];
    n0 = [cos(phi) ; sin(phi) ; 0];
  
% Rotation Matrix >> Chirikjian + Burdick 1994 (A Modal Approach for Hyper-redundant Robots)
%     n = [cos(phi)*cos(kappa*s) ; sin(phi)*cos(kappa*s) ; -sin(kappa*s)];
%     b = [-sin(phi) ; cos(phi) ; 0];
   
    % t = [cos(T)*sin(K) ; cos(K)*cos(T) ; sin(T)*s];
    
    
    % R = [n b t];
    
    % Position vector
    p = t0*(1/kappa)*sin(kappa*s) + n0*(1/kappa)*(1-cos(kappa*s));
    
    % Transformation matrix >> Chirikjian + Burdick 1994 (A Modal Approach for Hyper-redundant Robots)
    T = [cos(K)    sin(K)*cos(T)    -sin(K)*sin(T)           p(1)
           -sin(K)     cos(K)*cos(T)   -cos(K)*sin(T)         p(2)
            0                sin(T)                 cos(T)               p(3)
            0                  0                        0                    1];
        
    P = T*Pinit;
    
% Plot Robot
    % plot3(P(1),P(2),P(3),'.-r','LineWidth',2)
    plot(P(1),P(3),'.-r','LineWidth',2)
    hold on
    grid on

% if s == S
Pend = P;
% end
end