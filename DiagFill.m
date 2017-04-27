function B = DiagFill(A)
% Creates square matrix the same size as A 
% while mirroring the upper corner to the lower corner
B = A;
[n, m] = size(A);
if n ~= m, error('Matrix must be square'), end
for i = 1:n
    for j = 1:i
        if i ~= j
            B(i,j) = B(j,i);
        end
    end
end
end    
        