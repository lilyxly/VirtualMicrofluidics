%% Generate Lorenz curve from samtool mpile up data
MatrixAll={EcoliPunchSortedCoverage, StaphPunchSortedCoverage,...
    deBourcySortedCoverage};

FractionGenome=cell(size(MatrixAll));
FractionCoverage=cell(size(MatrixAll));
possum=cell(1,9);

for i=1:size(MatrixAll,2)
    for j=1:size(MatrixAll{i},2)
        SortedData=sort((MatrixAll{i}(:,j)));
        idx=[~isnan(SortedData)];
        pos=[1:sum(idx)]';
        possum{i}(1,j)=sum(idx);
        FractionGenome{i}(pos,j)=pos/max(pos);
        FractionCoverage{i}(pos,j)=cumsum(SortedData(idx))/max(cumsum(SortedData(idx)));
        
    end
end



%%
figure(1)
clf
%Ecoli gDNA and Staph gDNA
plot(FractionGenome{1}(1:1000:possum{1}(1,3),3), FractionCoverage{1}(1:1000:possum{1}(1,3),3),'k')
%plot(FractionGenome{2}(1:1000:possum{2}(1,1),1), FractionCoverage{2}(1:1000:possum{2}(1,1),1),'k')

hold on
% Ecoli all punches
plot(FractionGenome{1}(1:1000:possum{1}(1,2),2), FractionCoverage{1}(1:1000:possum{1}(1,2),2),'LineWidth',2.5,'Color',[0, 0, 0.501])
plot(FractionGenome{1}(1:1000:possum{1}(1,1),1), FractionCoverage{1}(1:1000:possum{1}(1,1),1),'LineWidth',2.5,'Color',[0, 0, 0.501])
plot(FractionGenome{1}(1:1000:possum{1}(1,4),4), FractionCoverage{1}(1:1000:possum{1}(1,4),4),'LineWidth',2.5,'Color',[0, 0, 0.501])
plot(FractionGenome{1}(1:1000:possum{1}(1,5),5), FractionCoverage{1}(1:1000:possum{1}(1,5),5),'LineWidth',2.5,'Color',[0, 0, 0.501])
plot(FractionGenome{1}(1:1000:possum{1}(1,6),6), FractionCoverage{1}(1:1000:possum{1}(1,6),6),'LineWidth',2.5,'Color',[0, 0, 0.501])
%plot(FractionGenome{1}(1:1000:possum{1}(1,7),7), FractionCoverage{1}(1:1000:possum{1}(1,7),7),'LineWidth',2.5,'Color',[0, 0, 0.501])
%plot(FractionGenome{1}(1:1000:possum{1}(1,8),8), FractionCoverage{1}(1:1000:possum{1}(1,8),8),'LineWidth',2.5,'Color',[0, 0, 0.501])

% Staph all punches
plot(FractionGenome{2}(1:1000:possum{2}(1,2),2), FractionCoverage{2}(1:1000:possum{2}(1,2),2),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,3),3), FractionCoverage{2}(1:1000:possum{2}(1,3),3),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,4),4), FractionCoverage{2}(1:1000:possum{2}(1,4),4),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,5),5), FractionCoverage{2}(1:1000:possum{2}(1,5),5),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,6),6), FractionCoverage{2}(1:1000:possum{2}(1,6),6),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,7),7), FractionCoverage{2}(1:1000:possum{2}(1,7),7),'Color',[0.882, 0, 0],'LineWidth',2)
plot(FractionGenome{2}(1:1000:possum{2}(1,1),1), FractionCoverage{2}(1:1000:possum{2}(1,1),1),'Color',[0.882, 0, 0],'LineWidth',2)

% single cell MDA MF+tube
% plot(FractionGenome{3}(1:1000:possum{3}(1,6),6), FractionCoverage{3}(1:1000:possum{3}(1,6),6),'Color','c')
% plot(FractionGenome{3}(1:1000:possum{3}(1,7),7), FractionCoverage{3}(1:1000:possum{3}(1,7),7),'Color','c')
% plot(FractionGenome{3}(1:1000:possum{3}(1,8),8), FractionCoverage{3}(1:1000:possum{3}(1,8),8),'Color','c')
% plot(FractionGenome{3}(1:1000:possum{3}(1,9),9), FractionCoverage{3}(1:1000:possum{3}(1,9),9),'Color','c')
% plot(FractionGenome{3}(1:1000:possum{3}(1,5),5), FractionCoverage{3}(1:1000:possum{3}(1,5),5),'Color','c')
% 
% % single cell MDA Tube
plot(FractionGenome{3}(1:1000:possum{3}(1,1),1), FractionCoverage{3}(1:1000:possum{3}(1,1),1),'k:','LineWidth',2)
plot(FractionGenome{3}(1:1000:possum{3}(1,2),2), FractionCoverage{3}(1:1000:possum{3}(1,2),2),'k:','LineWidth',2)
plot(FractionGenome{3}(1:1000:possum{3}(1,3),3), FractionCoverage{3}(1:1000:possum{3}(1,3),3),'k:','LineWidth',2)
plot(FractionGenome{3}(1:1000:possum{3}(1,4),4), FractionCoverage{3}(1:1000:possum{3}(1,4),4),'k:','LineWidth',2)
plot(FractionGenome{3}(1:1000:possum{3}(1,5),5), FractionCoverage{3}(1:1000:possum{3}(1,5),5),'k:','LineWidth',2)

hold off

%%
xlabel('Cumulative Position in Genome')
ylabel('Cummulative Reads Ranked by Coverage')
title('Lorenz Curve for Ecoli Hydrogle Sample')
set(gcf,'color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',18,'FontName','Arial','FontWeight','bold','LineWidth',4)
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1],'YTick',[0 0.2 0.4 0.6 0.8 1])
set(gca,'box','off')
set(gca,'Tickdir','out')
