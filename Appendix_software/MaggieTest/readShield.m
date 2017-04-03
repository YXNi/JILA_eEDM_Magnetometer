function [gradF,graderrF] = readShield
%% start communication
delete(instrfind);

s=serial('COM8'); %pc-arduino-magnetometer
set(s,'BaudRate',250000);
set(s,'Timeout',10);
fopen(s);
pause(1);

fread(s,1,'uint8')
fread(s,1,'uint8')
fread(s,1,'uint8')
fread(s,1,'uint8')
% fread(s,1,'uint8')
% fread(s,1,'uint8')
% fread(s,1,'uint8')
% fread(s,1,'uint8')

p = MagPCB_Host_Size;
pos = zeros(8,3);
pos(:,1:2) = p(:,1:2);
angle = -1/2*pi+p(:,3);

for i=1:1
figure(1);clf;    

dataA = readChip(s,'A');
dataA = reshape(dataA,3,8)';
dataA = calibrate(dataA,'A');
dataA = rotate(dataA,angle);
Ar = zeros(1,8);
[gradA,graderrA] = nlfit(pos(:),dataA(:),@Bpaper,Ar);
fprintf(['A Bax:' errstr(gradA(1),graderrA(1)) '\n']);
fA = Bpaper(gradA,pos(:));
fA = reshape(fA,length(fA)/3,3);
subplot(2,3,1);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),dataA(:,1),dataA(:,2),dataA(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),fA(:,1),fA(:,2),fA(:,3),'g');
view(0,-90);

dataB = readChip(s,'B');
dataB = reshape(dataB,3,8)';
dataB = calibrate(dataB,'B');

dataB = rotate(dataB,angle);
Ar = zeros(1,8);
[gradB,graderrB] = nlfit(pos(:),dataB(:),@Bpaper,Ar);
fprintf(['B Bax:' errstr(gradB(1),graderrB(1)) '\n']);
fB = Bpaper(gradB,pos(:));
fB = reshape(fB,length(fB)/3,3);

subplot(2,3,2);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),dataB(:,1),dataB(:,2),dataB(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),fB(:,1),fB(:,2),fB(:,3),'g');
view(0,-90);

dataC = readChip(s,'C');
dataC = reshape(dataC,3,8)';
dataC = calibrate(dataC,'C');

dataC = rotate(dataC,angle);
Ar = zeros(1,8);
[gradC,graderrC] = nlfit(pos(:),dataC(:),@Bpaper,Ar);
fprintf(['C Bax:' errstr(gradC(1),graderrC(1)) '\n']);
fC = Bpaper(gradC,pos(:));
fC = reshape(fC,length(fC)/3,3);

subplot(2,3,3);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),dataC(:,1),dataC(:,2),dataC(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),fC(:,1),fC(:,2),fC(:,3),'g');
view(0,-90);

dataE = readChip(s,'D');
dataE = reshape(dataE,3,8)';
dataE = calibrate(dataE,'E');

dataE = rotate(dataE,angle);
Ar = zeros(1,8);
[gradE,graderrE] = nlfit(pos(:),dataE(:),@Bpaper,Ar);
fprintf(['E Bax:' errstr(gradE(1),graderrE(1)) '\n']);
fE = Bpaper(gradE,pos(:));
fE = reshape(fE,length(fE)/3,3);

subplot(2,3,4);hold on;
quiver3(pos(:,1),pos(:,2),pos(:,3),dataE(:,1),dataE(:,2),dataE(:,3));
quiver3(pos(:,1),pos(:,2),pos(:,3),fE(:,1),fE(:,2),fE(:,3),'g');
view(0,-90);
% 
% dataF = readChip(s,'F');
% dataF = reshape(dataF,3,8)';
% dataF = calibrate(dataF,'A');
% 
% dataF = rotate(dataF,angle);
% Ar = zeros(1,8);
% [gradF,graderrF] = nlfit(pos(:),dataF(:),@Bpaper,Ar);
% fprintf(['F Bax:' errstr(gradF(1),graderrF(1)) '\n']);
% fF = Bpaper(gradF,pos(:));
% fF = reshape(fF,length(fF)/3,3);
% 
% subplot(2,3,5);hold on;
% quiver3(pos(:,1),pos(:,2),pos(:,3),dataF(:,1),dataF(:,2),dataF(:,3));
% quiver3(pos(:,1),pos(:,2),pos(:,3),fF(:,1),fF(:,2),fF(:,3),'g');
% view(0,-90);

pause(10e-3);
end

fclose(s);

end

function b = rotate(data,angle)
b = [cos(angle).*data(:,1)-sin(angle).*data(:,2) sin(angle).*data(:,1)+cos(angle).*data(:,2) data(:,3)];
end

function bout = calibrate(bin,index)
calib = csvread(['C:\Users\edm\Desktop\MagCalibrationControl\data\' index '\' index '.csv']);
a = calib(:,2:4:end);
b = calib(:,3:4:end);
c = calib(:,4:4:end);
d = calib(:,5:4:end);

b3 = bin.^3.*a;
b2 = bin.^2.*b;
b1 = bin.*c;
b0 = d;

bout = b3+b2+b1+b0;

end

function data = readChip(s,cmd)
avg = 10;

data = zeros(avg,24);
for i = 1:avg
    fwrite(s,cmd);  
    data(i,:) = fread(s,24,'float')';   
end
data = mean(data);

end

function pos = MagPCB_Host_Size

l = 120; %length of the board
r1 = 140;%radius of first row
r2 = r1+50;%radius of second row
R = 115;%radius of mounting hole
angle = asin(l/2/r1);%angle of magnetometers can cover


theta1 = linspace(-angle,angle,6); %first row angles
theta2 = linspace(-angle/2,angle/2,2);%second row angles

x1 = r1*sin(theta1)+200;
y1 = r1*cos(theta1)-R+150;
pos1 = [x1',y1',theta1'];
x2 = r2*sin(theta2)+200;
y2 = r2*cos(theta2)-R+150;
pos2 = [x2',y2',theta2'];

pos = [pos1;pos2];
pos(:,1:2) = pos(:,1:2)*1e-3;


end

function y = Bpaper(A,r)
        r = reshape(r,length(r)/3,3);
        
        x = r(:,1);
        y = r(:,2);
        z = r(:,3);
        
        o = zeros(size(x));
        
        Baxgrad = A(1)*[-x,-y,2*z];
        Btrans = A(2)*[x,-y,o];
        B1 = A(3)*[y,x,o];
        B2 = A(4)*[z,o,x];
        B3 = A(5)*[o,z,y];
        B0 = repmat(A(6:8),[size(x,1),1]);
        
        B = Baxgrad+Btrans+B1+B2+B3+B0;
        y = B(:);
end

function B = Bfree(A,r)
        r = reshape(r,length(r)/3,3);
        Amat = reshape(A(1:9),3,3);
        bx = A(10);by = A(11);bz = A(12);
        B = Amat*r';
        B(1,:) = B(1,:)+bx;
        B(2,:) = B(2,:)+by;
        B(3,:) = B(3,:)+bz;
        
        B = B';
        B = B(:);
end

