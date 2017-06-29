%% find and plot chimeras
%load the output from ChimeraAnalysis_SAMFilePairUp
load '/Volumes/blainey_lab-1/Lily/Hiseq0107/Lane1_SE_Staph_positions_2016-01-15.mat'
%%
chimera_thresh = 1000; % calculate late insert size as pos1-pos2+read2length
figure(1)
hold on
j=1;
AllInsertSize=0;
ChimeraFrequency=0;
InsertSizeRange=0;
%first row is 1kb-3, second row 3-10kb, third row large than 10kb
for i=1:size(pos,2)
    pos1=double(pos{i});
    rev1=double(reverse{i});
    rlength1=double(readlength{i});
    subplot(3,ceil(size(pos,2)/3),j);

    % Calculate the insert size and reversibitliy
    dif1 = abs(pos1(:,1) - pos1(:,2))+rlength1(:,2);
    dif1_ISize=abs(pos1(:,1) - pos1(:,2))+rlength1(:,2);
    difRevs=abs(rev1(:,1)-rev1(:,2));


    % Filter out non-mapping reads. Detele pairs where at least one end is not mapped
    dif1(any(ismember(pos1, [0, -1]),2)) = [];  
    dif1_ISize(any(ismember(pos1, [0, -1]),2))=[];
    difRevs(any(ismember(pos1, [0, -1]),2))=[]; 
    % If the difference of reversibility is 0, then boost insertsize to make it counted as chimera
    dif1(find(~difRevs))=20000;
     % Save all insert size including the wrong orientation ones 
    AllInsertSize(1:size(dif1_ISize,1),i)=dif1_ISize;
    
    Length1_3kb=length(find(dif1_ISize<3000 & dif1_ISize>1000))/length(dif1_ISize);
    Length3_10kb=length(find(dif1_ISize>=3000 & dif1_ISize<10000))/length(dif1_ISize);
    Length10kb=length(find(dif1_ISize>=10000))/length(dif1_ISize);
    
    % Plot histogram for Insert size distribution 
    xv = logspace(0,4.3,200);
    dx = diff(xv);
    dx = [dx dx(end)];
    TotalPairMapped=length(dif1_ISize); % Including wrong orientation pairs
    [y1, x1] = hist(dif1_ISize(find(dif1>chimera_thresh)), xv);
    
    % Plot reads with more than 1000bp insert size, including wrong
    % orientation
    plot(x1,log10(y1./TotalPairMapped));
    title(squeeze(files(i,1,end-26:end))', 'Interpreter', 'None');
    xlabel('Insert Size (>1000bp) ');
    ylabel('Chimera Frequency (log10)');
    % calculate chimera for different sizes 
    y1_chimeras=sum(dif1 > chimera_thresh) / length(dif1);
    y2_chimeras=sum(dif1 > (chimera_thresh*3)) / length(dif1);
    y3_chimeras=sum(dif1 > (chimera_thresh*10)) / length(dif1);
    legend([num2str(y1_chimeras*100, '%.3f') '% chimeras'])
    display(squeeze(files(i,1,end-26:end))')
    display([num2str(length(dif1_ISize)/length(pos1)*100) ' % mapped']) ;
    display([num2str((length(pos1)-length(dif1_ISize))/length(pos1)*100) ' % upmapped deleted']);
    display([num2str(length(find(~difRevs))/length(pos1)*100, '%.1f') ' % Wrong direction']);
    ChimeraFrequency(1,i)=y1_chimeras;
    ChimeraFrequency(2,i)=y2_chimeras;
    ChimeraFrequency(3,i)=y3_chimeras;
    InsertSizeRange(1,i)=Length1_3kb;
    InsertSizeRange(2,i)=Length3_10kb;
    InsertSizeRange(3,i)=Length10kb;
    MedianInsertSize(i)=median(dif1_ISize);
 
    j=j+1;
end
hold off
ChimeraFrequency*100



