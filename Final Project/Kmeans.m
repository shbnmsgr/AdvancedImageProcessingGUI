clear,clc,close all

img = imread('mainpic.tif');
image = zeros(size(img));
for i = 1:size(image,3)
    image(:,:,i) = mat2gray(img(:,:,i));
end
Features_1 = image(:,:,5:10);
K1 = 6;
M =zeros(size(Features_1,3),K1);
while true
    % Random Centers
    for z =1:size(Features_1,3)
        M(z,:) = randi([0,65535],1,K1)/65535;
        tM(z,:) = randi([0,65535],1,K1)/65535;
    end
    SSE1 = [];
    dSSE1 = [];
    for i = 1:100
        
        Dist1 = EuclideanDistCompute(Features_1,M);
        
        C1 = Classifier_Kmeans(Features_1,Dist1);
        
        M = MeanComputer(Features_1,C1);
        if sum(sum(isnan(M))) ~= 0
            M(isnan(M)) = tM(isnan(M));
        end
        SSE1(i) = sum(sum(Dist1.^2));
        if i>1
            dSSE1(i-1) = abs(SSE1(i)- SSE1(i-1));
            if dSSE1(i-1)<1e-20
                break
            end
        end
        
    end
    if i<100
        break
    end
end


final1 = ToRGB(C1);
imshow(final1)


% imshow(C1(:,:,1))
% imshow(C1(:,:,2))
% imshow(C1(:,:,3))
% imshow(C1(:,:,5))
% imshow(C1(:,:,4))