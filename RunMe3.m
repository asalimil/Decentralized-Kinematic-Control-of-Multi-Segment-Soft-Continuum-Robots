clc; clear; close all;

tuninggains = [0.382/10; 0.382*2];
for ss = 1:length(tuninggains)
   K = tuninggains(ss);

%--- Laplace matrix
Laplace = ...
    [+1 -1  0  0  0
    -1  2 -1  0  0
    0 -1  2 -1  0
    0  0 -1  2 -1
    0  0  0 -1  1
    ];

% Laplace = ...
%     [+1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0
%     -1 2 -1 0 0 0 0 0 0 0 0 0 0 0 0
%     0 -1 2 -1 0 0 0 0 0 0 0 0 0 0 0
%     0 0 -1 2 -1 0 0 0 0 0 0 0 0 0 0
%     0 0 0 -1 2 -1 0 0 0 0 0 0 0 0 0
%     0 0 0 0 -1 2 -1 0 0 0 0 0 0 0 0
%     0 0 0 0 0 -1 2 -1 0 0 0 0 0 0 0
%     0 0 0 0 0 0 -1 2 -1 0 0 0 0 0 0
%     0 0 0 0 0 0 0 -1 2 -1 0 0 0 0 0
%     0 0 0 0 0 0 0 0 -1 2 -1 0 0 0 0
%     0 0 0 0 0 0 0 0 0 -1 2 -1 0 0 0
%     0 0 0 0 0 0 0 0 0 0 -1 2 -1 0 0
%     0 0 0 0 0 0 0 0 0 0 0 -1 2 -1 0
%     0 0 0 0 0 0 0 0 0 0 0 0 -1 2 -1
%     0 0 0 0 0 0 0 0 0 0 0 0 0 -1 +1
%     ];
[Aa,Bb] = eig(Laplace);
lambda = diag(Bb)
%---

% N-segment
th = 0.01;
dt = 0.2;

% % small K
% K = 0.0382;
% p_res_shaded = 100;

% % large K
% K = 0.382*2;
% p_res_shaded = 5;

% p_res = 500;
t = 0; N = 5;

% EE / Target
Pe = zeros(3,1);
Pt = [4;4;0]; Po = [0;0;0];

tt = 0:-6/N:-6;
for cc = 1:N
    % P(cc).segment = [-2+2*rand; rand; 0];
    P(cc).segment = [0.2*tt(cc); 0.1*exp(-0.5*tt(cc)); 0];
    % strProp = {'.-r', '.-g', '.-b', '.-k', '.-c'};
    % lengthLink = norm(P(cc).segment);
    % plot(cc,lengthLink,strProp{cc},'LineWidth',2); hold on; grid on
    % EE
    Pe = Pe + P(cc).segment;
end
E = Pe - Pt;

Pg = [0;0;0];
for cx = 1:N
    PG(cx).segment = Pg + P(cx).segment;
    Pg = PG(cx).segment;
end

% % PLOT Initial configuration
% % figure(1);
% % Plot initial configuration
% line([Po(1) PG(1).segment(1)],[Po(2) PG(1).segment(2)],'Color','blue','LineWidth',3); hold on; axis equal;
% for jj = 1:N
%     if jj < N
%         line([PG(jj).segment(1) PG(jj+1).segment(1)],[PG(jj).segment(2) PG(jj+1).segment(2)],'Color','blue','LineWidth',6); hold on;
%         plot(PG(jj).segment(1),PG(jj).segment(2),'ok','LineWidth',6); hold on;
%     else
%         plot(PG(N).segment(1),PG(N).segment(2),'ok','LineWidth',6); hold on;
%     end
% end
%
% axis([-3 5 0 5]);
% grid on; xlabel('x (cm)'); ylabel('y (cm)');
% plot(Pt(1),Pt(2),'*r','LineWidth',2); hold on;
% drawnow;

%%
f = 0;
for ix = 1:N
    PlotData(ix).segment = [];
end
% while norm(E) >= th || t < 100
% tic
% while norm(E) >= th
% while norm(E) >= th || t < 155/5
while norm(E) >= th || t < 100
    % tic
    t = t + dt;
    f = f +1;
    Pe = [0;0;0];
    % clf;
    for n = 1:N
        if n == 1
            P(n).segment = P(n).segment + (-P(n).segment +P(n+1).segment)*dt;
        elseif n == N
            P(N).segment = P(N).segment + (-P(N).segment +P(N-1).segment -K*E)*dt;
        else
            P(n).segment = P(n).segment + (+P(n-1).segment -2*P(n).segment +P(n+1).segment)*dt;
        end
        Pe = Pe + P(n).segment;
        
        %         % if rem(f,p_res_shaded) == 0 || (f == 1)
        %         % PLOT
        %         % strShape = {'*--', 'v--', 'o--', 'x--', 's--', 'h-.', 'p-.', '<-.', '>-.', '^-.', 'v-', 'd-', '*-', 'v-', 'o-'};
        %         % strColor = {[1 0 0],[0 1 0],[0 0 1],[0 1 1],[1 0 1],[1 1 0],[0 0 0],[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],[0.6350 0.0780 0.1840],[0.33 0.35 0.47]};
        %         strShape = {'*', 'v', 'o', 'x', 's'};
        %         % strColor = {[1 0 0],[0 1 0],[0 0 1],[0 1 1],[1 0 1]};
        %         strColor = {'red','green','blue','black',[1 0 1]};
        %         lengthLink = norm(P(n).segment);
        %         plot(5*t,lengthLink,strShape{n},'Color',strColor{n},'LineWidth',2); hold on; grid on;
        %         % end
        %         % PlotData(n).segment = [PlotData(n).segment [t/100; norm(P(n).segment)]];
    end
    %     xlabel('t (s)');ylabel('length of prismatic joints (cm)');
    %     % legend('Prismatic joint 1','Prismatic joint 2','Prismatic joint 3','Prismatic joint 4','Prismatic joint 5','Prismatic joint 6','Prismatic joint 7','Prismatic joint 8','Prismatic joint 9','Prismatic joint 10','Prismatic joint 11','Prismatic joint 12','Prismatic joint 13','Prismatic joint 14','Prismatic joint 15');
    %     legend('Prismatic joint 1','Prismatic joint 2','Prismatic joint 3','Prismatic joint 4','Prismatic joint 5');
    %     axis([0 155 0 2.5]);
    %     drawnow;
    %
    
    Pg = [0;0;0];
    for c = 1:N
        PG(c).segment = Pg + P(c).segment;
        Pg = PG(c).segment;
    end
    
    E = Pe - Pt;
    if norm(E) < th
        fend = f;
    else
        fend = 0;
    end
    % Plot Error
    strProp = {'o-r', '*-g'};
    strSize = {1,2};
    plot(t/2,norm(E),strProp{ss},'LineWidth',strSize{ss}); hold on; grid on; drawnow;
    xlabel('t (sec)'); ylabel('norm of error (cm)');
    axis([0 50 0 7]); 
    % legend('K = 0.0382','K = 0.764');
    
    %     % PLOT
    %     % if rem(f,p_res) == 0 || f == 1 || f == fend
    %     if f == fend
    %         line([Po(1) PG(1).segment(1)],[Po(2) PG(1).segment(2)],'Color','blue','LineWidth',6); hold on; axis equal;
    %         for j = 1:N
    %             if j < N
    %                 line([PG(j).segment(1) PG(j+1).segment(1)],[PG(j).segment(2) PG(j+1).segment(2)],'Color','blue','LineWidth',6); hold on; axis equal;
    %                 plot(PG(j).segment(1),PG(j).segment(2),'ok','LineWidth',6); hold on;
    %             else
    %                 plot(PG(N).segment(1),PG(N).segment(2),'ok','LineWidth',6); hold on;
    %             end
    %         end
    %         axis([-3 5 0 5]);
    %         grid on; xlabel('x (cm)'); ylabel('y (cm)');
    %         plot(Pt(1),Pt(2),'*r','LineWidth',2); hold on;
    %         drawnow;
    %         M(f) = getframe;
    %     elseif rem(f,p_res_shaded) == 0
    %         % else
    %         line([Po(1) PG(1).segment(1)],[Po(2) PG(1).segment(2)],'Color',[0.75,0.75,0.75],'LineWidth',6); hold on; axis equal;
    %         for jc = 1:N
    %             if jc < N
    %                 line([PG(jc).segment(1) PG(jc+1).segment(1)],[PG(jc).segment(2) PG(jc+1).segment(2)],'Color',[0.75,0.75,0.75],'LineWidth',6); hold on; axis equal;
    %                 plot(PG(jc).segment(1),PG(jc).segment(2),'o','Color',[128,128,128]/255,'LineWidth',6); hold on;
    %             else
    %                 plot(PG(jc).segment(1),PG(jc).segment(2),'o','Color',[128,128,128]/255,'LineWidth',6); hold on;
    %             end
    %         end
    %         axis([-3 5 0 5]);
    %         grid on; xlabel('x (cm)'); ylabel('y (cm)');
    %         plot(Pt(1),Pt(2),'or','LineWidth',2); hold on;
    %         drawnow;
    %         M(f) = getframe;
    %     end
end
%     dt = toc;
% disp(['time: ', num2str(t), 'Error : ', num2str(norm(E))])
% end
% toc
% plot(Po(1),Po(2),'ok','LineWidth',6); hold on;

% video = VideoWriter('RegulatorControl.mp4','MPEG-4');
% open(video)
% writeVideo(video,M);
% close(video)

%---
% Plot link's lengths

%---
disp(['Elapsed time: ', num2str(t)])

end
% legend('K = 0.04','K = 1');
% PlotLinkLengths(PlotData,N)


