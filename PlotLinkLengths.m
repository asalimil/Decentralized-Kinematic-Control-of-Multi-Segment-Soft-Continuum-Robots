function PlotLinkLengths(PlotData,N)

for ti = 1:size(PlotData(1).segment,2)
    for n = 1:N
        t = PlotData(n).segment(1,ti);
        P = PlotData(n).segment(2,ti);
        %
        strShape = {'*--', 'v--', 'o--', 'x--', 's--', 'h-.', 'p-.', '<-.', '>-.', '^-.', 'v-', 'd-', '*-', 'v-', 'o-'};
        strColor = {[1 0 0],[0 1 0],[0 0 1],[0 1 1],[1 0 1],[1 1 0],[0 0 0],[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],[0.6350 0.0780 0.1840],[0.33 0.35 0.47]};
        lengthLink = norm(P);
        plot(t,lengthLink,strShape{n},'Color',strColor{n},'LineWidth',0.5); hold on;
    end
    grid on;
xlabel('t (sec)');ylabel('length of prismatic joints (cm)');
legend('Prismatic joint 1','Prismatic joint 2','Prismatic joint 3','Prismatic joint 4','Prismatic joint 5','Prismatic joint 6','Prismatic joint 7','Prismatic joint 8','Prismatic joint 9','Prismatic joint 10','Prismatic joint 11','Prismatic joint 12','Prismatic joint 13','Prismatic joint 14','Prismatic joint 15');
axis([0 13.5 0 4]);
drawnow;

end


end