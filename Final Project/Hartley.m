function [h,g,final] = Hartley(N);

u = N; v = N; x = N; y = N;


final = zeros(N,N,N*N);

for uu = 0:u-1
    
    
    for vv = 0:v-1
   
        band_num = (uu)*N + vv + 1;
        for xx = 0:x-1
            
            for yy = 0:y-1
                
                final(xx+1,yy+1,band_num) = (cos((2*pi*uu*xx)/N)+sin((2*pi*uu*xx)/N))*(cos((2*pi*vv*yy)/N)+sin((2*pi*vv*yy)/N));
                
            end
        end
    end
end



h = (1/N^2)*final;
g = (1/N^2)*final;

end