e = 40;
A = [];
for i = 1:e
    b = [];
    for j = 1:e
       aij = sqrt((i^2)+(j^2));
       b = [b aij];
    end
    A = [A; b];
end
%%
    c = setdiff(A, diag(A));

  while sqrt(sum(c.^2)) > 1e-8
    R = zeros(e, e);
    for i=1:e
        R(i, i) = 1;
    end
    c = setdiff(A, diag(A));
    p = max(abs(c));
   
    if p == max(c)
        p = p;
    else
        p = -p;
    end
    
    [row, col] = find(abs(p - A) < 1e-12);
    q = row(1);
    z = row(2);
   
    denom = A(z, z) - A(q, q);    
   
    theta = (0.5)*atan2((2*p),denom);
    
    R(q,q) = cos(theta);
    R(z,z) = cos(theta);
    R(q,z) = sin(theta);
    R(z,q) = -sin(theta);
     
    A = transpose(R)*A*R;
    sqrt(sum(c.^2));
  end
  diag(A)


  



