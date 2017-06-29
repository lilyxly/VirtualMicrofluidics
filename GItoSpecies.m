%% Use GI number to get species name
warning('off')
%% 
for i=1:882
    for j=1
        if data(i,j)>0
        s=getgenbank(num2str(data(i,j)));
        species{i,j}=s.Source;
        else 
          continue  
        end
        i
        j
    end
end
