for img_num = 1:3
    file_path = sprintf("Crack Detection/Data/Positive/%05d.jpg",img_num);
    level = 0.6;
    figure(img_num);
    sgtitle(sprintf("%05d",img_num));
    subplot(3,2,1);
    I=imread(file_path);
    imshow(I)
    title('Original image')
    %%Image adjust 
    Istrech = imadjust(I,stretchlim(I));
    subplot(3,2,2);
    imshow(Istrech)
    title('Contrast stretched image')
    %%Convert RGB image to gray
    Igray_s = rgb2gray(Istrech);
    Ithres = im2bw(Igray_s,level);
    subplot(3,2,3);
    imshow(Ithres);
    title('Segmented cracks')
    
    %%Image morphological operation
    gradmag = Ithres;
    BW_cleaned = bwmorph(gradmag,'clean',inf);
    subplot(3,2,4);
    imshow(BW_cleaned)
    title('Cleaned image');
    
    
    %%skeleton
    binaryImage = ~BW_cleaned;
    skelImage = bwskel(binaryImage, 'MinBranchLength', 10);
    MinBranchLength = round(sum(skelImage(:))/2);
    skelImage = bwskel(binaryImage, 'MinBranchLength', MinBranchLength);
    subplot(3,2,5)
    imshow(skelImage);
    title('Skeleton Image');
    subplot(3,2,6);
    imshow(imoverlay(I, skelImage, 'red'));
    title('Skeleton overlay on Original Image');
    snapnow;
end