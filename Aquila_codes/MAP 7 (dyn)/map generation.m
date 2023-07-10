clear all
close all
bound = 20;
map = robotics.OccupancyGrid(bound,bound,15) %resolution is the number of pixels in one cell; no needs to consider it below
show (map);
hold on
 
S = 5:0.1:15;
S_(1:101) = 10.5;
S__ = [S;S_];
obs_1 = transpose(S__);

setOccupancy(map, obs_1, 1) % centre long bar
inflate(map,1)
show(map)

Re = 1:0.1:3;
Re_(1:21) = 15;
Re__ = [Re_;Re];
obs_Re = transpose(Re__);
setOccupancy(map, obs_Re, 1) % centre long bar
show(map)

%%

 cntx = bound/2;
 cnty = bound/2;
 s = cnty/0.1;
 A(1,s) = cntx-1;
 A(1:s) = cntx;
 B = cnty:0.1:bound-0.1;
 C = [A; B];
 C = transpose(C);
 A = A/2.5;
 D = [B; A];
 D = transpose(D);
 q = (bound/0.1) - 10;
 q = (bound/0.1);
 E(1,q) = bound-1;
 E(1:q) = 0.1;
 I(1,q) = bound-1;
 I(1:q) = bound-0.1;
 F = 1:0.1:bound-0.1;
 F = 0:0.1:bound-0.1;
 H = [E;F];
 H = transpose(H);
 G = [I;F];
 G = transpose(G);
 J = [F;I];
 J = transpose(J);
 W = [F;E];
 W = transpose(W);
 d_ = 0;

% % H left vertical
 setOccupancy(map, H, 1)
 show(map)
% % % G right vertical
 setOccupancy(map, G, 1)
% % % J upper horizontal
 setOccupancy(map, J, 1)
% % % Lower boundary
  setOccupancy(map, W, 1)

 inflate(map,1)
 show(map)
 