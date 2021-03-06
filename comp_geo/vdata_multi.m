% vdata_multi.m
% 
% This file contains datasets for the matrix 'p', which is needed for the
% voroni-tesselation. The variable "p" is 2 x (number of grains).  p(i,j) 
% gives the ith component of the center of grain j. The choice of the
% dataset, that will be used, is done by setting the parameter 'IFdatasetp'
% in the inpute file routine.
%
% To fill in an additional dataset in this file, you have to enlarge the
% switch-case-structure.

switch IFdatasetp
    case 1
        p = [0 0; 9 0; 4.5 9];      % 2 grains
    case 2
        p = [0 0; 13 1; 7.4 15];    % 2 grains, unsymmetric  
    case 3
        p = [0 -0.2; 3 0.2; 1.5 5]; % Debug problem
    case 4
        p = [0 0; 10 0; 5 9];       % 2 grains for beambending example
    case 5
        %Multi 6
        p = [ 0.0  2.1;
              0.1  0.2;
              0.0 -2.0;
              2.0  1.1;
              2.0 -1.0;
              3.9  2.0;
              4.0 -0.1;
              4.0 -2.3;
              6.1  1.0;
              6.0 -1.1;
              8.0  2.1;
              8.0  0.2;
              7.9 -2.0;
              9.9  1.1;
             10.2 -1.1;
             12.2  2.0;
             12.0 -0.1;
             11.9 -2.1;
             14.1  1.0;
             13.8 -0.9;
             16.1  2.2;
             16.0  0.2;
             15.9 -2.0];
    case 6
        %Multi1
        p =     [0    2.0000;
                 0    0.2000;
                 0   -2.0000;
            2.0000    1.1000;
            2.0000   -1.0000;
            4.0000    2.0000;
            4.0000   -0.1000;
            4.0000   -2.0000;
            6.0000    1.0500;
            6.0000   -1.1000;
            8.2000    2.0000;
            8.0000    0.1000;
            8.0000   -2.0000;
           10.0000    1.0000;
           10.0000   -1.1000;
           12.0000    2.0000;
           12.0000   -0.1000;
           12.0000   -2.0000;
           14.0000    1.0000;
           14.0000   -1.1000;
           16.0000    2.0000;
           16.0000    0.2000;
           16.0000   -2.0000];
    case 7
        % Multi5
        p =     [0    2.1000;
            0.1000    0.2000;
                 0   -2.0000;
            2.0000    1.1000;
            2.0000   -1.0000;
            3.9000    2.0000;
            4.0000   -0.1000;
            4.0000   -2.3000;
            6.1000    1.0000;
            6.0000   -1.1000;
            8.0000    2.1000;
            8.0000    0.2000;
            7.9000   -2.0000;
           10.1000    1.1000;
           10.0000   -1.2000;
           12.2000    2.0000;
           12.0000   -0.1000;
           11.9000   -2.1000;
           14.1000    1.0000;
           13.8000   -0.9000;
           16.1000    2.2000;
           16.0000    0.2000;
           16.0000   -2.0000];
    case 8
        %Multi4
        p =     [0    2.0000;
            0.1000    0.2000;
                 0   -2.0000;
            2.0000    1.1000;
            2.0000   -1.0000;
            3.9000    2.0000;
            4.0000   -0.1000;
            4.0000   -2.3000;
            6.1000    1.0000;
            6.0000   -1.1000;
            8.0000    2.1000;
            8.0000    0.2000;
            7.9000   -2.0000;
           10.1000    1.0000;
           10.0000   -1.1000;
           12.2000    2.0000;
           12.0000   -0.1000;
           12.0000   -2.1000;
           14.1000    1.0000;
           14.0000   -0.9000;
           16.1000    2.2000;
           16.0000    0.2000;
           16.0000   -2.0000];
    case 9
        % Multi3
        p =     [0    2.0000;
            0.1000    0.2000;
                 0   -2.0000;
            2.0000    1.1000;
            2.0000   -1.0000;
            3.9000    2.0000;
            4.0000   -0.1000;
            4.0000   -2.3000;
            6.1000    1.0000;
            6.0000   -1.1000;
            8.0000    2.1000;
            8.0000    0.2000;
            7.9000   -2.0000;
           10.1000    1.0000;
           10.0000   -1.1000;
           12.0000    2.0000;
           12.2000   -0.1000;
           12.0000   -2.1000;
           14.1000    1.0000;
           14.0000   -1.1000;
           16.1000    2.2000;
           16.0000    0.2000;
           16.1000   -2.0000];
    case 10
        % Multi2
        p =     [0    2.0000;
                 0    0.2000;
                 0   -2.0000;
            2.4000    1.1000;
            2.0000   -1.1000;
            3.9000    2.0000;
            4.0000   -0.1000;
            4.0000   -2.3000;
            6.1000    1.0000;
            5.9000   -1.1000;
            8.0000    2.1000;
            8.0000    0.2000;
            7.7000   -2.1000;
           10.0000    1.0000;
           10.0000   -1.1000;
           12.0000    2.0000;
           12.2000   -0.1000;
           12.0000   -2.0000;
           14.0000    1.0000;
           14.0000   -0.9000;
           16.0000    2.0000;
           16.0000    0.0000;
           16.0000   -2.0000];
    case 11
        p = [0 -2.6; 10 -2.6; 5 6.4];       % 3 grains
    case 12
        p = [-4 -3.1; 3.5 -3.1; 6 5.9];       % 3 grains
    case 13
        p = [9.1 0; 19.1 0; 14.1 9];       % 2 grains (vertical interface)
    case 14
%         p = [-1.0 0.0; 20.0 3.0; -1.0 6.0];    % 3 grains for
                                                % Hertzian_Contact_1
        p = [-1.0 0.0000001; 20.0 3.0000001; -1.0 6.0000001];
    case 15
        p = [-3 -2.6; 7 -2.6; 2 6.4];       % 3 grains
    case 16
        p = [10.5 1.5;12.5 -0.5;12.5 3.5];       % 3 grains
    case 17
        p = [-1.0 0.05; 20.0 3.05; -1.0 6.05];    % 3 grains for
                                                % Hertzian_Contact_2
    case 18
        p = [12.0 -2.0; 41.0 0.0; 12 2.0];    % 3 grains for
                                                % frictionless_sliding_anal
                                                % yt_1
    case 19
        p = [100 0; 110 0; 105 9]; % interfaces far away from domain --> only one grain
    case 20
        p = [12.0 -2.0; 41.0 0.0; 12 2.00001];    % 3 grains for
                                                % frictionless_sliding_anal
                                                % yt_1
    case 21
        p = [-1.0 -2.0; 100.0 0.0; -1 2.00001];    % 3 grains for
                                                % frictionless_sliding_anal
                                                % yt_3
    case 22
        p = [-1.0 -2.0; 100.0 0.0; -1 2.0];    % 3 grains for
                                                % frictionless_sliding_anal
                                                % yt_4
    case 23
        p = [-1.0 0.0; 6.0 0.5; -1 1.0];    % 3 grains for square
    case 24
        p = [2.0 -1.0; 3.0 -1; 4 5.0];    % 3 grains for beam_TM2
    case 25
        p = [4 2; 12 2; 8 8];       % 2 grains for frictionless_sliding_analyt_6
    case 26
        p = [0 3; 3*sin(pi/4) 3*cos(pi/4); 10 20];       % 2 grains for frictionless_sliding_analyt_7
    case 27
        p = [-23 0; 18 15; 18 -15];       % 2 grains for frictionless_sliding_analyt_8
    case 28
        p = [6 -2; 8 3; 10 -2];   
    case 29
        p = [0.2 -0.55; -0.8 1.05; 0.2 2.65];   % 3 grains for frictionless_sliding_analyt_2
                                                % unstructured mesh
    case 30
        p = [0.2 -1.55; -0.8 0.05; 0.2 1.65];   % 3 grains for frictionless_sliding_analyt_2
                                                % structured mesh
    case 31
        p = [0 0; 8 0; 4 9];       % 2 grains for plasticity_2
    case 32
        p = [ 600.0 0; 100.0 -50.0; 100.0 50.0];    % horizontal interface at y=0
    case 33
        p = [0 0; 4 0; 2 9];    % vertical interface at x=2
    case 34
        p = [0 0; 1.5 sqrt(3)/2; 1.5 -sqrt(3)/2; 3 0];    % example in 'Simone2006'
    case 35
        p = [600.0 1.5; 100.0 -48.5; 100.0 51.5];    % horizontal interface at y=1.5
    case 36
        p = [100.0 51.5; 600.0 1.5; 100.0 -48.5];    % horizontal interface at y=1.5
    case 37
        p = [100.0 48.5; 600.0 -1.5; 100.0 -51.5];    % horizontal interface at y=-1.5
    case 38
        p = [0 0; 11 0; 5.5 9];       % 2 grains for beambending example
    case 39
        p = [ 0.8443    0.2622;
              0.1948    0.6028;
              0.2259    0.7112;
              0.1707    0.2217;
              0.4357    0.2967;
              0.3111    0.3188;
              0.9234    0.4242;
              0.4302    0.5079;
              0.9049    0.2625;
              0.9797    0.8010;
              0.2373    0.9631;] * 10;
        p(:,2) = p(:,2) - 5;
    case 40
        p = [ 0.9278    0.5290;
              0.6456    0.30258;
              0.4795    0.7635;
              0.5447    0.7720;
              0.6773    0.0329;
              0.5329    0.9727;
              0.7350    0.1420;
              0.5225    0.1569;
              0.9937    0.6963;
              0.2087    0.0638;
              0.8158    0.4954;
              0.0597    0.5203;
              0.2696    0.8411;
              0.4046    0.4849;
              0.06123   0.6943];
         p(:,2) = p(:,2) - 0.5;
      case 41
        p = [ 0.1567    0.2448;
              0.9619    0.3632;
              0.0046    0.8712;
              0.7749    0.0154;
              0.8173    0.0430;
              0.8687    0.1690;
              0.0844    0.6491;
              0.3998    0.7317;
              0.2659    0.6380;
              0.8301    0.4509;
              0.4314    0.5470;
              0.9106    0.2963;
              0.1818    0.7447;
              0.2638    0.2190;
              0.1455    0.6868;
              0.1361    0.1835;
              0.8793    0.3785;
              0.5797    0.6256;
              0.5399    0.7702;
              0.1450    0.0811;
              0.8530    0.9294;
              0.6221    0.7757;
              0.3510    0.4868;
              0.5132    0.4359;
              0.3718    0.4468;
              0.0960    0.3063;
              0.2399    0.5285;
              0.1233    0.5108;
              0.1839    0.8176;
              0.2400    0.7948;
              0.4173    0.6443;
              0.0497    0.3586;
              0.9027    0.8116;
              0.9400    0.5058;
              0.4909    0.3507;
              0.5293    0.9590;
              0.3377    0.8759;
              0.9001    0.5052;
              0.3502    0.6125;
              0.1112    0.5870;
              0.7803    0.2077;
              0.3897    0.3012;
              0.2417    0.4709;
              0.4039    0.2305;
              0.0965    0.8443;
              0.1320    0.1948;
              0.9421    0.2259;
              0.9561    0.1707;
              0.5752    0.2277;
              0.0598    0.4357];
        p(:,2) = p(:,2) - 0.5;
      case 42
        p = [ 0.9278    0.5290;
              0.6456    0.32258;
              0.4795    0.7635;
              0.5447    0.7720;
              0.6773    0.0329;
              0.5329    0.9727;
              0.7350    0.1420;
%               0.5225    0.1569;
              0.9937    0.6963;
              0.2087    0.0638;
%               0.8158    0.4954;
              0.0597    0.5203;
              0.2696    0.8411;
              0.4046    0.4849];
%               0.06123   0.6943];
         p(:,2) = p(:,2) - 0.5;
      case 43
        p = [];
    otherwise
        error('MATLAB:comp_geo:vdata_multi',...
            'Unvalid ID for "IFdatasetp" !!!');
end;