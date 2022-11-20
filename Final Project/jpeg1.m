I = imread('peppers.png');
imshow(I);

ImageSize = 8*prod(size(I));

Y = I;
A = [.229 .587 .114 ; -.168736 -.331264 .5 ; .5 -.418688 -.081312];
Y(:,:,1) = A(1,1)*I(:,:,1) + A(1,2)*I(:,:,2) + A(1,3)*I(:,:,3);
Y(:,:,2) = A(2,1)*I(:,:,1) + A(2,2)*I(:,:,2) + A(2,3)*I(:,:,3) + 128;
Y(:,:,3) = A(3,1)*I(:,:,1) + A(3,2)*I(:,:,2) + A(3,3)*I(:,:,3) + 128;

% Let's use MATLAB's inbuilt convert (because of the normalizations):
Y = rgb2ycbcr(I);

lb = {'Y', 'Cb', 'Cr'};

for channel = 1:3
    subplot(1,3,channel)
    Y_C = Y;
    Y_C(:,:,setdiff(1:3,channel)) = intmax(class(Y_C))/2;
    imshow(ycbcr2rgb(Y_C))
    title([lb{channel} ' component'],'fontsize',16)
end

subplot(1,2,1)
imshow( I )
title('Original')
subplot(1,2,2)
Y_d = Y;
Y_d(:,:,2) = 10*round(Y_d(:,:,2)/10);
Y_d(:,:,3) = 10*round(Y_d(:,:,3)/10);
imshow(ycbcr2rgb(Y_d))
title('Downsampled image')

subplot(1,2,1)
imshow( I )
title('original')
subplot(1,2,2)
Y_d = Y;
Y_d(:,:,1) = 10*round(Y_d(:,:,1)/10);
imshow(ycbcr2rgb(Y_d))
title('Downsample illuminance')

Y_d = Y;
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);

clf
box = Y_d;
II = box(200:207,200:207,1);
Y = chebfun.dct(chebfun.dct(II).').';
surf(log10(abs(Y))), title('DCT coefficients')
set(gca,'fontsize',16)


Q = [16 11 10 16 24 40 51 61 ;
     12 12 14 19 26 28 60 55 ;
     14 13 16 24 40 57 69 56 ;
     14 17 22 29 51 87 80 62 ;
     18 22 37 56 68 109 103 77 ;
     24 35 55 64 81 104 113 92 ;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
before = nnz(Y);
Y = Q.*round(Y./Q);
after = nnz(Y);

before, after



I = imread('peppers.png');
Y_d = rgb2ycbcr( I );
% Downsample:
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);
% DCT compress:
A = zeros(size(Y_d));
B = A;
for channel = 1:3
    for j = 1:8:size(Y_d,1)-7
        for k = 1:8:size(Y_d,2)
            II = Y_d(j:j+7,k:k+7,channel);
            freq = chebfun.dct(chebfun.dct(II).').';
            freq = Q.*round(freq./Q);
            A(j:j+7,k:k+7,channel) = freq;
            B(j:j+7,k:k+7,channel) = chebfun.idct(chebfun.idct(freq).').';
        end
    end
end

subplot(1,2,1)
imshow(ycbcr2rgb(Y_d))
title('Original')
subplot(1,2,2)
imshow(ycbcr2rgb(uint8(B)));
title('Compressed')
shg

CompressedImageSize = 8*nnz(A(:,:,1)) + 7*nnz(A(:,:,2)) + 7*nnz(A(:,:,3))
CompressedImageSize/ImageSize


b = A(:);
b = b(:);
b(b==0)=[];  %remove zeros.
b = floor(255*(b-min(b))/(max(b)-min(b)));
symbols = unique(b);
prob = histcounts(b,length(symbols))/length(b);
dict = huffmandict(symbols, prob);
enco = huffmanenco(b, dict);
FinalCompressedImage = length(enco)


length(enco)/ImageSize   % x7 compression. 