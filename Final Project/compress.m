
%---------------------------------%
%-------- BMP Compression --------%
%---------------------------------%
%
% This function applies RLE8 Compression to an image. ------> in taabe
% feshordesaazi run length coding ra emal mikonad
%
function compress(I)
% Open the same file where we wrote the header.
F = fopen('Pic.bmp', 'ab');
height = size(I, 1);
for j = height : -1 : 1
    % Apply RLE to the vector N° j.
    v = I(j, :);
    [symbols, occur] = rle(v);
    
    % ABSOLUTE MODE.
    k = 1;
    while k <= length(symbols) % While k didn't reach the end of the vector.
        % The number of repititions is coded in 1 byte, so the max value is 255. 
        while occur(k) > 255
            fwrite(F, 255, 'uint8');
            fwrite(F, symbols(k), 'uint8');
            occur(k) = occur(k) - 255;
        end
        
        if occur(k) < 4
            y = []; % y is where we store symbols that have occur < 4.
            while (k <= length(symbols) && occur(k) < 4)
                if occur(k) == 2
                    y = [y symbols(k) symbols(k)];
                    k = k + 1;
                else if occur(k) == 1
                        y = [y symbols(k)];
                        k = k + 1;
                    else
                        y = [y symbols(k) symbols(k) symbols(k)];
                        k = k + 1;
                    end
                end
            end
            max = length(y);
            % Writing in the file.
            
            % Number of symbols that should be escaped mustn't be higher
            % than 255.
            while max > 255
                fwrite(F, 0, 'uint8');
                fwrite(F, 255, 'uint8');
                
                for l = 1 : 255
                    fwrite(F, y(l), 'uint8');
                end
                fwrite(F, 0, 'uint8');
                y = y(256:end);
                max = length(y);
            end
            
            if max == 2 % if it remains 2 symbols to write.
                if y(1) == y(2) % if they're the same.
                    fwrite(F, 2, 'uint8');
                    fwrite(F, y(1), 'uint8');
                else
                    fwrite(F, 1, 'uint8');
                    fwrite(F, y(1), 'uint8');
                    fwrite(F, 1, 'uint8');
                    fwrite(F, y(2), 'uint8');
                end
            else if max == 1 % if only 1 symbol remains.
                    fwrite(F, 1, 'uint8');
                    fwrite(F, y(1), 'uint8');
                else
                    fwrite(F, 0, 'uint8');
                    fwrite(F, max, 'uint8');
                    for l = 1 : max
                        fwrite(F, y(l), 'uint8');
                    end
                end
            end
            
            % if the number of written symbols is odd, write a zero in the
            % end.
            if max > 2 && mod(max, 2) ~= 0
                fwrite(F, 0, 'uint8');
            end
            
        else
            fwrite(F, occur(k), 'uint8');
            fwrite(F, symbols(k), 'uint8');
            k = k + 1;
        end
    end
    
    if j == 1 % if it was the last line.
        % End of file (EOF).
        fwrite(F, 0, 'uint8');
        fwrite(F, 1, 'uint8');
    else
        % End of line (EOL).
        fwrite(F, 0, 'uint8');
        fwrite(F, 0, 'uint8');
    end
end
fclose(F);
end