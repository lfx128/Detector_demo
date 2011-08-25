% call 'usbinit' to setup the webcam

clc; %clear all; 
addpath('mex'); 

scan.win_height    = 30;
scan.win_width     = 30;
scan.row_shift     = 3;
scan.col_shift     = 3;
scan.scale         = 1.40;
scan.threshold     = 3;
scan.min_std       = 0;
scan.nms           = 1;
scan.overlap       = .4;

load('detectors/frontal.mat');

img = rgb2gray(getsnapshot(vid));
h   = imshow(img,[],'InitialMagnification',200);
set(h,'EraseMode','none');
tic;
while 1
    clc; disp(1/toc); tic;
    img = getsnapshot(vid);
    
    [bb, conf] = abFindObject(img(:,:,2),model,scan);
    set(h,'CData',bb_burn(img,bb)); drawnow;
end

% call 'usbclear'