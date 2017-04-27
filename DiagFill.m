function B = DiagFill(A,C)
% Enter p for positive flip, n for negative flip
% Creates square matrix the same size as A 
% while mirroring the upper corner to the lower corner
B = A;
[n, m] = size(A);
if n ~= m, error('Matrix must be square'), end
for i = 1:n
    for j = 1:i
        if i ~= j
            if C == 'p'
            B(i,j) = B(j,i);
            elseif C == 'n'
            B(i,j) = -B(j,i); 
            else 
                error('Enter p for positive flip or n for negative flip') 
            end
        end
    end
end
end    
        