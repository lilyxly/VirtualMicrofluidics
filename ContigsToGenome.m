%% Create de novo genome with space between nodes, with the mapping to
% reference genome 
RefGenomeDH10B=getgenbank('NC_010473.1','SequenceOnly', true);
DeNovoGenome3979(1:size(RefGenomeDH10B,2))='-';
pos1=double(pos{1});
query1=querySequence{1};
readname1=readnames{1};
queryLength1=double(queryLength{1});

%%
for i=2:size(pos1,2)
    if pos1(i)==0 | isequal(readname1(i,:),readname1(i-1,:)); 
        continue
    end
  
    DeNovoGenome3979([pos1(i):(pos1(i)+queryLength1(i)-1)])=...
        query1(i,[1:queryLength1(i)]);
end
fastawrite('DeNovoGenome3979_uniqNode_0322.txt','De novo assembly of SRR1613979',DeNovoGenome3979);
%%
RefGenomeBL21=getgenbank('NC_012971.2','SequenceOnly', true);
DeNovoGenomeLX1(1:size(RefGenomeBL21,2))='-';
pos2=double(pos{2});
pos2=pos2+1;
query2=querySequence{2};
readname2=readnames{2};
queryLength2=double(queryLength{2});
%%
for i=2:size(pos2,2)
    if pos2(i)==0 |isequal(readname2(i,:),readname2(i-1,:)); 
        continue
    end
    
    DeNovoGenomeLX1([pos2(i):(pos2(i)+queryLength2(i)-1)])=...
        query2(i,[1:queryLength2(i)]);
end
 fastawrite('DeNovoGenomeLX1_uniqNode_0322.txt','De novo assembly of LX1',DeNovoGenomeLX1);
%%
RefGenome8325=getgenbank('NC_007795','SequenceOnly', true);
DeNovoGenomeLX2(1:size(RefGenome8325,2))='-';
pos3=double(pos{3});
pos3=pos3+1;
query3=querySequence{3};
readname3=readnames{3};
queryLength3=double(queryLength{3});
%%
for i=2:size(pos3,2)
    if pos3(i)==0 |isequal(readname3(i,:),readname3(i-1,:)); 
        continue
    end
    DeNovoGenomeLX2([pos3(i):(pos3(i)+queryLength3(i)-1)])=...
        query3(i,[1:queryLength3(i)]);
end
 fastawrite('DeNovoGenomeLX2_uniqNode_0322.txt','De novo assembly of LX2',DeNovoGenomeLX2);



