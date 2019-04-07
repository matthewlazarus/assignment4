function ind(n1, n2, val)

%define global variables
global G b C; 

d=size(G,1);
xr = d+1; 

%Add New Row/Col
b(xr)=0;
G(xr, xr) = 0;
C(xr, xr) = 0;

if(n1~=0)
    G(n1, xr) = 1;
    G(xr, n1) = 1;
end

if(n2~=0)
   G(n2, xr) = -1;
   G(xr, n2) = -1;
end

C(xr, xr)= C(xr, xr)-val; 

end