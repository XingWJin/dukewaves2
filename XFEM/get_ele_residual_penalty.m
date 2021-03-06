% get_ele_residual_penalty.m
%
% CALL: get_ele_residual_penalty()
%
% Computes the contribution of the contraints to the residual, depending on
% the method of constraint enforcement.
% 
% Input arguments:
%   xcoords             x-coordinates of element's nodes
%   ycoords             y-coordinates of element's nodes
%   seg_cut_info        information about the interface in the element
%   endpoints           endpoints of interface
%   id_dof              shows, if a node is enriched or not
%   id_eqns             mapping between element's nodes and global DOFs
%   totaldis            displacements in base and extra DOFs of the element
%
% Returned variables
%   penalty_normal      
%   penalty_tangent      
%   id                  id-array to enable assembly into global stiffnes
%                       matrix 'bigk'
%

% Author: Matthias Mayr (07/2010)

function [penalty_normal penalty_tangent id] = ...
  get_ele_residual_penalty(xcoords,ycoords,seg_cut_info, ...
  endpoints,id_dof,id_eqns,totaldis)
%% Initialize
% some coordinate variables
xes = [];
yes = [];

penalty_normal = zeros(12,12);    % matrix for normal constraints
penalty_tangent = zeros(12,12);   % matrix for tangential constraints

intersection = seg_cut_info.xint; % intersection points of interface with 
                                  % element edges

normal = seg_cut_info.normal;     % vector normal to interface

% shape function matrix for first and second enrichments
N = zeros(2,12);
% ----------------------------------------------------------------------- %
%% Establish a set of flags
flg = [0 0 0 0 0 0];

% Establish which nodes are "postively" enriched, and
% which reside in the "negative" grain
pos_g = seg_cut_info.positive_grain;
neg_g = seg_cut_info.negative_grain;

[pn_nodes] =... 
   get_positive_new(seg_cut_info.elemno,pos_g,neg_g);

% First enrichment
for n = 1:3     % loop over nodes
  % Get the "first" enrichment of node
  enrich1(n) = id_dof(n,3);

  if enrich1(n) == pos_g
    if (pn_nodes(n,1) == 1)
      flg(n) = 1;
    else
      flg(n) = 0;
    end
  elseif enrich1(n) == neg_g
    if (pn_nodes(n,2) == 1)
      flg(n) = -1;
    else
      flg(n) = 0;
    end        
  end
end

% Second Enrichment
for n = 1:3     % loop over nodes
  % Get the "second" enrichment of nodes
  enrich2(n) = id_dof(n,5);  

  if enrich2(n) == pos_g  % If this enrichment corresponds 
                          % to the positive grain
    if (pn_nodes(n,1) == 1)
      flg(3 + n) = 1;
    else
      flg(3 + n) = 0;
    end

  elseif enrich2(n) == neg_g
    if (pn_nodes(n,2) == 1)
      flg(3 + n) = -1;
    else
      flg(3 + n) = 0;
    end        
  end
end
% ----------------------------------------------------------------------- %
%% EVALUATE GAP
gap = evaluate_gap_penalty(xcoords,ycoords,id_eqns, ...
    id_dof,seg_cut_info,endpoints,totaldis);
% ----------------------------------------------------------------------- %
%% PREPARE GAUSS QUADRATURE
% end points of intersection - direction doesn't matter - this is for the
% segment jacobian calculation

if all(size(intersection) == [2 2])
  p1 = intersection(1,:);
  p2 = intersection(2,:);
elseif all(size(intersection) == [1 2])
  p1 = intersection(1,:);

  % Second endpoint of segment is also end point of interface
  endpoint = endpoints(1,:);

  inside = polygon_contains_point_2d ( 3, [xcoords;ycoords], endpoint );

  if inside
    p2 = endpoint;
  else
    p2 = endpoints(2,:);
  end
end

% jacobian of segment to global
he = sqrt((p1(1)-p2(1))^2 + (p1(2)-p2(2))^2);
seg_jcob = he/2;

% 3 gauss points on segments, since the product of linear shape function
% matrices is integrated, i.e. the integrand is quadratic, so at least 3
% gauss points are required for an exact integration.
gauss = [-sqrt(3/5) 0 sqrt(3/5)];
weights = [5/9 8/9 5/9];

% get area of element
Area = det([[1 1 1]' xcoords' ycoords'])/2;
% ----------------------------------------------------------------------- %
%% loop over Gauss points to assemble 'N'
for g = 1:3
  %% assemble N
  % Get real coordinates of gauss points
  xn = 0.5*(1-gauss(g))*p1(1)+0.5*(1+gauss(g))*p2(1);
  yn = 0.5*(1-gauss(g))*p1(2)+0.5*(1+gauss(g))*p2(2);

  for b = 1:3     % Evaluate shape functions
    % Get coorindates of area opposite node of concern
    xes = xcoords;
    yes = ycoords;
    xes(b) = xn; 
    yes(b) = yn;
    Larea = det([[1 1 1]' xes' yes'])/2;

    % Evaluate shape function
    N(1,2*b-1) = N(1,2*b-1) + Larea/Area .* weights(g) * seg_jcob;   % First enrichment
    N(2,2*b)   = N(2,2*b)   + Larea/Area .* weights(g) * seg_jcob;
    N(1,2*b+5) = N(1,2*b+5) + Larea/Area .* weights(g) * seg_jcob;   % Second enrichment
    N(2,2*b+6) = N(2,2*b+6) + Larea/Area .* weights(g) * seg_jcob;
  end;
end;
  
% multiply values belonging to nodes in the 'negative' grain with '-1'
for c = 1:6
  N(:,2*c-1:2*c) = N(:,2*c-1:2*c)*flg(c);
end;
  
% normal direction
penalty_normal = N' * normal * normal' * gap;

% tangential direction
penalty_tangent = N' * (eye(2) - normal * normal') * gap;
% ----------------------------------------------------------------------- %
%% Build id array
% get DOFs for first enrichment
id(1) = id_eqns(1,3);  % 1st extra x dof
id(2) = id_eqns(1,4);  % 1st extra y dof
id(3) = id_eqns(2,3);  % 1st extra x dof
id(4) = id_eqns(2,4);  % 1st extra y dof
id(5) = id_eqns(3,3);  % 1st extra x dof
id(6) = id_eqns(3,4);  % 1st extra y dof

% get DOFs for second enrichment
id(7)  = id_eqns(1,5);  % 2nd extra x dof
id(8)  = id_eqns(1,6);  % 2nd extra y dof
id(9)  = id_eqns(2,5);  % 2nd extra x dof
id(10) = id_eqns(2,6);  % 2nd extra y dof
id(11) = id_eqns(3,5);  % 2nd extra x dof
id(12) = id_eqns(3,6);  % 2nd extra y dof
% ----------------------------------------------------------------------- %

% nodal_dis = zeros(length(id),1);
% for i=1:length(id)
%   if id(i) ~= 0
%     nodal_dis(i) = totaldis(id(i));
%   else
%     nodal_dis(i) = 0;
%   end;
% end;
% 
% penalty_normal = penalty_normal * nodal_dis;
% penalty_tangent = penalty_tangent * nodal_dis;

end

