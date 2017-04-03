function testAnalysis
r1 = 0.14;                    %first row radius
r2 = 0.19;                    %second row radius
r = [repmat(r1,6,1);repmat(r2,2,1)];
coverage = 0.442911044073639; %angle of one side
spread = [linspace(-coverage,coverage,6)';-coverage/2;coverage/2];

zbot = repmat(-0.0703137,8,1);
ztop = repmat(0.0703137,8,1);

dangle = -0.06778; %displacement angle of top flange from the bottom

% bottom A,C
rA = r;
rC = r;

phiA = deg2rad(-45);
phiC = deg2rad(30);

alphaA = spread+phiA;
alphaC = spread+phiC;

zA = zbot;
zC = zbot;

% top B,E
rB = r;
rE = r;

phiB = deg2rad(45);
phiE = deg2rad(180);

alphaB = spread+phiB+dangle;
alphaE = spread+phiE+dangle;

zB = ztop;
zE = ztop;

% collect data
dataA = csvread('A.csv');
dataB = csvread('B.csv');
dataC = csvread('C.csv');
dataE = csvread('E.csv');

data = [dataA;dataB;dataC;dataE];
angle = [alphaA;alphaB;alphaC;alphaE];
r = [rA;rB;rC;rE];
z = [zA;zB;zC;zE];

[pos,b] = positionTransfer(r,angle,data,z);

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
const = ones(size(x));

%% first order

var1 = [x,y,z,const];
mat1 = var1\b;
f1 = var1*mat1;
res1 = b-f1;

figure(1);clf;
subplot(1,2,1);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),b(:,1),b(:,2),b(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),f1(:,1),f1(:,2),f1(:,3));
legend('data','1st fit');
grid on;
view(168,24);
title('first order');

subplot(3,2,2);
histogram(res1(:,1)*1e3);
xlabel('x residual (mG)');
subplot(3,2,4);
histogram(res1(:,2)*1e3);
xlabel('y residual (mG)');
subplot(3,2,6);
histogram(res1(:,3)*1e3);
xlabel('z residual (mG)');

%% second order

var2 = [x.^2,y.^2,z.^2,x.*y,y.*z,x.*z,x,y,z,const];
mat2 = var2\b;
f2 = var2*mat2;
res2 = b-f2;

figure(2);clf;
subplot(1,2,1);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),b(:,1),b(:,2),b(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),f2(:,1),f2(:,2),f2(:,3));
legend('data','2nd fit');
grid on;
view(168,24);
title('second order');

subplot(3,2,2);
histogram(res2(:,1)*1e3);
xlabel('x residual (mG)');
subplot(3,2,4);
histogram(res2(:,2)*1e3);
xlabel('y residual (mG)');
subplot(3,2,6);
histogram(res2(:,3)*1e3);
xlabel('z residual (mG)');

%% third order;
% var3 = var_3(pos);
% mat3 = var3\b;
% f3 = var3*mat3;
% res3 = b-f3;
% 
% figure(3);clf;
% subplot(1,2,1);hold on;
% quiver3(pos(:,1),pos(:,2),pos(:,3),b(:,1),b(:,2),b(:,3));
% quiver3(pos(:,1),pos(:,2),pos(:,3),f3(:,1),f3(:,2),f3(:,3));
% legend('data','2nd fit');
% grid on;
% view(168,24);
% title('third order');
% 
% subplot(3,2,2);
% histogram(res3(:,1)*1e3);
% xlabel('x residual (mG)');
% subplot(3,2,4);
% histogram(res3(:,2)*1e3);
% xlabel('y residual (mG)');
% subplot(3,2,6);
% histogram(res3(:,3)*1e3);
% xlabel('z residual (mG)');

%% larger picture
% [x,z] = meshgrid(linspace(-1,1,10));
% y = zeros(size(x(:)));
% rvec = [x(:),y(:),z(:)];
% rvec = var_2(rvec);
% 
% bvec = rvec*mat2;
% 
% figure(3);clf;hold on;
% quiver3(x(:),y(:),z(:),bvec(:,1),bvec(:,2),bvec(:,3));
% 
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% grid on;
% view(104,42);
% title('second order');

end

function [pos,b] = positionTransfer(r,angle,bin,z)
b = [cos(angle).*bin(:,1)-sin(angle).*bin(:,2),sin(angle).*bin(:,1)+cos(angle).*bin(:,2),bin(:,3)];
pos = [cos(angle).*r,sin(angle).*r,z];
end

function [var2] = var_2(pos)
x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
const = ones(size(x));

var2 = [x.^2,y.^2,z.^2,x.*y,y.*z,x.*z,x,y,z,const];
end

function [var3] = var_3(pos)
x = pos(:,1);
y = pos(:,2);
z = pos(:,3);
const = ones(size(x));

var2 = [x.^2,y.^2,z.^2,x.*y,y.*z,x.*z,x,y,z,const];

var3 = [x.^3,y.^3,z.^3,x.^2.*y,x.^2.*z,y.^2.*x,y.^2.*z,z.^2.*x,z.^2.*y,x.*y.*z];

var3 = [var3,var2];

end