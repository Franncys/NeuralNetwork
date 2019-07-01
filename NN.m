function NN()
    I = imread('0_circle.png')
    %J = imresize(I, 0.3)
    %J = imresize(I, 0.8);
    J = imsharpen(J,'Radius',2,'Amount',2);
    
    figure
    imshow(I)
    title('Original Size')
    
    figure 
    imshow(J)
    title('Resized Image')
end