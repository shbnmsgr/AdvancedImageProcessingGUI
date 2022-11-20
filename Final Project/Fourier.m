function [g,final] = Fourier(N);

u = N; v = N; x = N; y = N;


final = zeros(N,N,N*N);

for uu = 0:u-1
    
    
    for vv = 0:v-1
   
        band_num = (uu)*N + vv + 1;
        for xx = 0:x-1
            
            for yy = 0:y-1
                
                final(xx+1,yy+1,band_num) = exp(-2*(0+1j)*pi*(uu*xx+vv*yy)/N);
                
            end
        end
    end
end




g = (1/N^2)*final;

end