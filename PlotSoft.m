function Pend = PlotSoft(Pinit,Theta,L)

s0 = 0.0001;  ds = 0.01;
S = L;
Th = Theta;
Phi = 0;
th = 0;
% N = (S - s0)/ds + 1;
for s = s0:ds:S 
    th = th + Th*ds;
    kappa = th/s;
    [~,~,~,Pend] = arm_Kinematics(kappa,s,th,Phi,Pinit);
end
xlabel('x'); ylabel('y'); zlabel('z'); axis equal; drawnow;


end