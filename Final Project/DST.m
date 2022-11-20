function [h,g,final] = DST(N);

u = N; v = N; x = N; y = N;


final = zeros(N,N,N*N);

for uu = 0:u-1
    
    
    for vv = 0:v-1
   
        band_num = (uu)*N + vv + 1;
        for xx = 0:x-1
            
            for yy = 0:y-1
                
                final(xx+1,yy+1,band_num) = sin(((xx+1)*(uu+1)*pi)/(N+1))*sin(((yy+1)*(vv+1)*pi)/(N+1));
                
            end
        end
    end
end



h = (2/(N+1))*final;
g = (2/(N+1))*final;

end