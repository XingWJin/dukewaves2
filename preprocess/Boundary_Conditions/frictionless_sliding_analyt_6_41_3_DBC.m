% DBCs

num_x = 41;
num_y = 3;

% center nodes on both ends
dispbc(1,4) = 1;
dispbc(1,(num_x+1)*(num_y+1)-ceil(num_y/2)) = 1;

dispbc(2,4) = 1;
dispbc(2,(num_x+1)*(num_y+1)-ceil(num_y/2)) = 1;

% left boundary
for i=1:num_y+1
  dispbc(1,i) = 1;
%   dispbc(2,i) = 1;
end;

% right boundary
for i=num_x*(num_y+1) + 1:(num_x+1)*(num_y+1)
  dispbc(1,i) = 1;
%   dispbc(2,i) = 1;
end;