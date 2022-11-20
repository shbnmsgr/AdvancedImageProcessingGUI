function [h,g,final] = DCT(N);

u = N; v = N; x = N; y = N;


final = zeros(N,N,N*N);

for uu = 0:u-1
    if uu == 0
        alpha_u = sqrt(1/N);
    else
      alpha_u = sqrt(2/N);  
    end
    
    for vv = 0:v-1
       if vv == 0
        alpha_v = sqrt(1/N);
    else
      alpha_v = sqrt(2/N);  
    end
        band_num = (uu)*N + vv + 1;
        for xx = 0:x-1
            
            for yy = 0:y-1
                
                final(xx+1,yy+1,band_num) = alpha_u*alpha_v*cos(((2*xx+1)*uu*pi)/(2*N))*cos(((2*yy+1)*vv*pi)/(2*N));
                
            end
        end
    end
end



h = final;
g = final;

end