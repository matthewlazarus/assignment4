function  res(n1,n2,val)
% res.m:

% define global variables
global G;
val=1/val;

if (n1 ~= 0)
    G(n1,n1) = G(n1,n1) + val;
end

if (n2 ~= 0)
    G(n2,n2) = G(n2,n2) + val;
end

if (n1~=0 && n2 ~= 0)
    G(n1,n2) = G(n1,n2) - val;
    G(n2,n1) = G(n2,n1) - val;
end

%End

end

