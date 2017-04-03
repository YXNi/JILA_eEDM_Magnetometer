function [pos,b] = positionTransfer(r,angle,bin)
b = [cos(angle).*bin(:,1)-sin(angle).*bin(:,2),sin(angle).*bin(:,1)+cos(angle).*bin(:,2),bin(:,3)];
pos = [cos(angle).*r,sin(angle).*r];
end