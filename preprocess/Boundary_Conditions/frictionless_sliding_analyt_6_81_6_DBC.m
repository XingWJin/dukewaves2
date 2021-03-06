% DBCs

% center nodes on both ends
% dispbc(1,4) = 1;
% dispbc(1,571) = 1;
% 
% dispbc(2,4) = 1;
% dispbc(2,571) = 1;


% left boundary
for i=1:7
  dispbc(1,i) = 1;
  dispbc(2,i) = 1;
end;

% right boundary
displacement = -0.024576;
for i=568:574
  dispbc(1,i) = 1;
  dispbc(2,i) = 1;
  ubar(2,i) = displacement;
end;