tic
for img_num = 1:10
   
    file_path = sprintf("Crack Detection/Data/Positive/%05d.jpg",img_num);
    level = 0.5;
    figure(img_num);
    sgtitle(sprintf("%05d",img_num));
    subplot(2,2,1);
    I=imread(file_path);
    imshow(I)
    title('Original image')

    %%Image adjust 
    im = imresize(I, 0.5);
      im_gray = rgb2gray(im);
      subplot(2,2,2);
      imshow(im_gray)
      title('Greyscale image')
    
    %%edge detection
     im_edge = edge(im_gray, 'sobel');
     subplot(2,2,3);
      imshow(im_edge)
      title('Edge image')

      binaryImage = im_edge;
    
    subplot(2,2,4);
    imshow(imoverlay(im_gray, binaryImage, 'blue'));
    title('Skeleton overlay on Original Image');
    snapnow;
end
timelasped=toc