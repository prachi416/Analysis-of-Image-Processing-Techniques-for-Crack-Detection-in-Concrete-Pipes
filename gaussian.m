tic
for img_num =1:5
    file_path = sprintf("Crack Detection/Data/Positive/%05d.jpg",img_num);
    level = 0.5;
    figure(img_num);
    sgtitle(sprintf("%05d",img_num));
    subplot(3,2,1);
    I=imread(file_path);
    imshow(I)
    title('Original image')
    %%Image adjust 
    im = imresize(I, 0.5);
      im_gray = rgb2gray(im);
    subplot(3,2,2);
    imshow(im_gray)
    title('Grey scaled image')
    
    %%Image Gaussian filter
    im_blur = imgaussfilt(im_gray, 2);
    subplot(3,2,3);
    imshow(im_blur);
    title('Smooth image')
    
    %%edge detection
     im_edge = edge(im_blur, 'prewitt');
     subplot(3,2,4);
      imshow(im_edge)
      title('Edge image')

   im_open = bwareaopen(im_edge, 8);
     disk_element = strel('disk', 4);
      im_dilated = imdilate(im_open, disk_element);
      subplot(3,2,5);
      imshow(im_dilated)
      title('Dilated image')
      
      binaryImage = im_edge;
    
    subplot(3,2,6);
    imshow(imoverlay(im_gray, binaryImage));
    title('Skeleton overlay on Original Image');
    snapnow;
end
timeElapsed = toc;