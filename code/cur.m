function  cur(n1,n2,val)
% cur.m:

% define global variables
global b;

if (n1 ~= 0)
    b(n1) = b(n1) - val;
end

if (n2 ~= 0)
    b(n2) = b(n2) + val;
end

%End
end