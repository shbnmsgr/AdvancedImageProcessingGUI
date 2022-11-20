function h = InverseFourier(N);
warning ('off')
u = N; v = N; x = N; y = N;


final = zeros(N,N,N*N);

for uu = 0:u-1
    
    
    for vv = 0:v-1
   
        band_num = (uu)*N + vv + 1;
        for xx = 0:x-1
            
            for yy = 0:y-1
                
                final(xx+1,yy+1,band_num) = exp(2*(0+1j)*pi*(uu*xx+vv*yy)/N);
                
            end
        end
    end
end

for i = 1:N*N
    subplot(N,N,i)
    imshow(final(:,:,i),[])
end


h = final;

end