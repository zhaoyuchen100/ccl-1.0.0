function visualise_move_3link (figh, R, X, L,varargin)
% visualise_move (R, X, L)
% Visualisation of the arm movement
% Input:
%   R               Task space movements
%   X               Joint space movements
%   L               Arm link length
%   varargin        Arguments for figure title and position
dim_n = length(R) ;
xmin = -1.5 ; xmax = 2 ;
ymin = -2.5 ; ymax = 2.5 ;

fig_handle = figure(figh);
if nargin > 3
    title_txt = varargin{1};title(title_txt);
    pos       = varargin{2};set(fig_handle, 'Position', pos);
end
% axis equal
xlim([xmin,xmax]) ; ylim([ymin,ymax]) ;
R1 = squeeze([R(1,1,:); R(2,1,:)]);
R2 = squeeze([R(1,2,:); R(2,2,:)]);
R3 = squeeze([R(1,3,:); R(2,3,:)]);

plot( R1(1,:),R1(2,:), '--','LineWidth', 2) ;hold on;
plot( R2(1,:),R2(2,:),'--', 'LineWidth', 2) ;
plot( R3(1,:),R3(2,:),'--', 'LineWidth', 2) ;

xlabel('x');
ylabel('y');
% stroboscopic plot of arm
cc = rand;
c = [cc,cc,cc] ;
h1 = [];
h1 = plot_arm_3link (h1,X(:,1), L, c) ;axis tight;pause (0.1) ;
c = [cc,0,0] ;
h2 = [];
for i=2:dim_n
    h2 = plot_arm_3link (h2,X(:,i), L, c) ;
    if i ~=dim_n
        pause (0.1) ;
        h2.reset; 
    end
%     axis tight;
end
end
