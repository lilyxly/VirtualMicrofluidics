%% load images
filename = '20130716LowConcentration_NTC1.tif';
numImages = 13; 
%%
%read in first image for background
bkgd = double(imread(filename,1)); 
%%
%allocate the memory for the images
ImageStack = zeros(size(bkgd,1),size(bkgd,2),numImages); 

%read in the images
for iStack = 1:numImages
    ImageStack(:,:,iStack) = double(imread(filename,iStack)); 
end
%% Calculate background
figure(1);
subplot(2,1,1); 
imagesc(bkgd); 

bkg_filter = fspecial('gaussian',200,50); 
bkgd = convolve2(bkgd,bkg_filter,'reflect'); 

subplot(2,1,2); 
imagesc(bkgd); 

%% Subtract background from all images in stack
ImageStack = ImageStack-repmat(bkgd,[1 1 numImages]); 
%%
%this should go inside a for loop for every image in the stack
ClusterArea=NaN(2000,numImages);
for i=1:numImages
img = ImageStack(:,:,i); 

%find the mean
meanImage = mean(img(:)); 

%find the std
stdImage = std(img(:)); 

%threshold (multiple of std)
thresh = 2.5; 

bw = img; 
bw(bw>(meanImage+thresh*stdImage))=1e5; 
bw(bw<(meanImage+thresh*stdImage))=0; 
bw(bw==1e5)=1; 

%smooth and eliminate small particles
bw = bwareaopen(bw,10); 
figure(2)
subplot(2,1,1); 
imagesc(img); 
subplot(2,1,2); 
imagesc(bw); 
%get all the objects in the image
CC = bwconncomp(bw); 
AreaStruct=regionprops(CC,'ConvexArea');
ClusterArea(1:size(AreaStruct,1),i)=[AreaStruct.ConvexArea]';
ClusterCount(i)=size(AreaStruct,1);
end
Radius=sqrt(nanmean(ClusterArea)/pi)/0.81;
SEM=nanstd(Radius)./sqrt(ClusterCount);


figure(3)
subplot(2,1,1)
errorbar(Radius,SEM)
subplot(2,1,2)
plot(ClusterCount)

    