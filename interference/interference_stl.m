clear; close all;
p0 = [100, 0, 0]';
p1 = [0, 100, 0]';
p2 = [0, 0, 100]';

p0x = p0(1);
p0y = p0(2);
p0z = p0(3);
p1x = p1(1);
p1y = p1(2);
p1z = p1(3);
p2x = p2(1);
p2y = p2(2);
p2z = p2(3);

%干渉面F
n = [0,0,1]';
P = [0,0,10]';

stl = stlread('cube.stl');
points = stl.Points;
for i=1:length(points)
   point = points
end

[q0,q1]=check_interference(p0,p1,p2,n,P);
q0
q1




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Q=compute_interference(p0,p1,n,P)
v0 = P - p0;
v1 = p1 - p0;
t = dot(n,v0) / dot(n,v1);
Q = p0 + t*v1;
end

%check if there is an interference
function [q0,q1]=check_interference (p0, p1, p2, n, P)
v0 = P - p0;
v1 = P - p1;
v2 = P - p2;
d0 = dot(n,v0);
d1 = dot(n,v1);
d2 = dot(n,v2);

if(d0>0 && d1>0 && d2<0)
%   (0,2)(1,2)
  q0=compute_interference(p0,p2,n,P);
  q1=compute_interference(p1,p2,n,P);
elseif(d1>0 && d2==0 && d3==0)
%   (1,2)
  q0=compute_interference(p1,p2,n,P);
  q1=[];
elseif(d1>0 && d2==0 && d3<0)
%   (0,2)
  q0=compute_interference(p0,p2,n,P);
  q1=[]; 
elseif(d1>0 && d2<0 && d3<0)
%   (0,1)(0,2)
  q0=compute_interference(p0,p1,n,P);
  q1=compute_interference(p0,p2,n,P);
elseif(d1==0 && d2==0 && d3<0)
%   (0,1)      
  q0=compute_interference(p0,p1);
  q1=[]; 
else
    q0=[];
    q1=[];
end

end



