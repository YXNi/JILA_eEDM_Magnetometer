function [gradF,graderrF] = speedTest
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
fread(s,1,'uint8')
fread(s,1,'uint8')
fread(s,1,'uint8')
fread(s,1,'uint8')

p = MagPCB_Host_Size;
pos = zeros(8,3);
pos(:,1:2) = p(:,1:2);
angle = -1/2*pi+p(:,3);

t = zeros(1,20);
for i=1:20
    tic;
dataA = readChip(s,'A');
    t(i) = toc;
% dataA = readChip(s,'B');
% dataA = readChip(s,'C');
% dataA = readChip(s,'E');
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
avg = 2;

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

