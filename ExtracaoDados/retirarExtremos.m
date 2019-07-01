function input = retirarExtremos(imagens)
    escala = 50;
    
    T = numel(imagens);

    min_points = 150;
    
    for i = 1 : T
        points = detectHarrisFeatures(imagens(i).matriz);
        disp(points);
        points = points.selectStrongest(escala);
        
        imshow(imagens(i).matriz); 
        hold on;
        plot(points);
        
        size_points = size(points);
        size_points = size_points(1,1);

        if size_points < min_points
            min_points = size_points;
        end    
    end
    input = 1;
%     for i = 1 : T
%         points = detectHarrisFeatures(imagens(i).matriz);
%         disp(points);
%         points = points.selectStrongest(escala).Location;
%         
%         imshow(imagens(i).matriz); hold on;
%         plot(points);
%         
%         points = points(1:min_points);
%         input(1:min_points,i) = points;
%             
%         
%     end
end