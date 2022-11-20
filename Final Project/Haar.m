function AH = Haar(N)

warning ('off');

% format long g;



h = zeros(N);



for u = 0:N-1
    p = floor(log2(u));
    q = u - (2^p);
    for v = 0:N-1
        pp = floor(log2(v));
        qq = v - (2^pp);
        band_num = (u)*N + v + 1;
        for  x= 0:N-1
            
            for  y= 0:N-1
                if   (u==0 && (x/N) >= 0 && (x/N) < 1)
                    hu = 1;
                elseif (u>0 && (x/N) >=(q/(2^p)) && (x/N) < (q+0.5)/(2^p))
                    hu = 2^(p/2);
                elseif (u>0 && (x/N) >= (q+0.5)/(2^p) && (x/N) < (q+1)/(2^p))
                    hu = -(2^(p/2));
                else
                    hu = 0;
                end
                if (v==0 && (y/N) >= 0 && (y/N) < 1)
                    
                    hv = 1;
                    
                    
                elseif (v>0 && (y/N) >=(qq/(2^pp)) && (y/N) < (qq+0.5)/(2^pp))
                    
                    hv = 2^(pp/2);
                    
                elseif (v>0 && (y/N) >= (qq+0.5)/(2^pp) && (y/N) < (qq+1)/(2^pp))
                    
                    hv = -(2^(pp/2));
                    
                else
                    
                    hv = 0;
                    
                end
                h(x+1,y+1,band_num) = hu*hv;
            end
            
        end
        
    end
end
AH = (1/N)*h;

end