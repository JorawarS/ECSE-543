function hbw = find_band(A)%to find half bandwidth of a matrix
n=size(A,1);
hbw=0;
    for i=1:n
        for j=1:n
            if A(i,j)~=0
                if abs(i-j)+1>hbw
                    hbw =abs(i-j)+1;
                end
            end
        end
    end
end

