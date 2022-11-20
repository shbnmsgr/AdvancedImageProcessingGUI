
%------------------------------------%
%-------- Writing BMP header --------%
%------------------------------------%
function header(fullPath)
infos = imfinfo(fullPath);
F = fopen('Pic.bmp', 'wb');             % Creating a binary file. ------> yek file binary ijad mikonim
% ---- BMP header ---- %
extraBytes = mod((4 - mod(infos.Width, 4)), 4);
imageSize = infos.Width * infos.Height;
fileSize = imageSize + 54 + 256 * 4;
% BMP file header.
fwrite(F, 'B', 'uint8');                % 'B' (1 byte).
fwrite(F, 'M', 'uint8');                % 'M' (1 byte).
fwrite(F, fileSize, 'uint32');          % File size (4 bytes).
fwrite(F, 0, 'uint32');                 % Reserved (4 bytes).
fwrite(F, 54 + 256*4, 'uint32');        % Offset to bitmap data (4 bytes).
% BMP file info header.
fwrite(F, 40, 'uint32');                % Info header size (4 bytes).
fwrite(F, infos.Width, 'uint32');       % Width of image (4 bytes).
fwrite(F, infos.Height, 'uint32');      % Height of image (4 bytes).
fwrite(F, 1, 'uint16');                 % Number of color planes, always 1 (2 bytes). -----> tedad e palet haye rangi ra mohasebe mikonim
fwrite(F, 8, 'uint16');                 % Number of bits per pixel (2 bytes).
fwrite(F, 1, 'uint32');                 % Type of compression (0 none, 1 RLE-8, 2 RLE-4) (4 bytes) -----> noe feshrdesaazi ra taein mikonim k az che no Run length encoding estefade shavad.
fwrite(F, 0, 'uint32');                 % Size of image data (4 bytes).
fwrite(F, 2835, 'uint32');              % Resolution, you
fwrite(F, 2835, 'uint32');              % can leave it like that.
fwrite(F, 256, 'uint32');               % Number of colors in the colormap (4 bytes).
fwrite(F, 0, 'uint32');                 % 0 means all colors are importants (4 bytes).
% ---- Colormap ---- %
if infos.BitDepth > 8                   % if it's a RGB image.
    [I, map] = rgb2ind(imread(fullPath), 256);
else
    [I, map] = imread(fullPath);
end
infos.image = I;
% Writing the colormap.
if isempty(map)                         % if it's a grey image.
    for i = 0 : 2^8 - 1 
        for j = 1 : 3
            fwrite(F, i, 'uint8');
        end
      fwrite(F, 0, 'uint8');
    end
else
    for i = 1 : length(map)
        for j = 3 : -1 : 1
            fwrite(F, map(i, j) * 255, 'uint8');
        end
      fwrite(F, 0, 'uint8');
    end 
end
fclose(F);