
%----------------------%
%-------- Main --------%
%----------------------%
[filename, pathname] = uigetfile({'*.png;*.bmp;*.jpg'}, 'Pick an image', 'Multiselect', 'off'); % yek tasvir ra be delkhah entekhab konid
if  isequal(filename, 0)
    warndlg('Ups');
else
    fullPath = [pathname filename];
    header(fullPath);
    compress(imread(fullPath)); % ba in taabe tasvir ra feshorde (compress) mikonim
    imshow('Pic.bmp');
end
