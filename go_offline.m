clc; clear all; 
addpath('mex'); 

scan.win_height    = 24;
scan.win_width     = 24;
scan.row_shift     = 2;
scan.col_shift     = 2;
scan.scale         = 1.25;
scan.threshold     = 0;
scan.min_std       = 1;
scan.nms           = 1;
scan.overlap       = .4;

% Frontal
load('detectors/frontal.mat');
img = imread('faceTestPic/images/bmp/test13.bmp');
[bb, conf] = abFindObject(img,model,scan);
figure(1); imshow(bb_burn(img,bb(:,conf>4)),[]); 

% Left Profile

% load('detectors/profile.mat');
% img = fliplr(imread('images/afghanistan.pgm'));
% [bb, conf] = abFindObject(img,model,scan);
% figure(2); imshow(bb_burn(img,bb(:,conf>5)),[]); 

% Left Profile
% load('detectors/profile.mat');
% img = imread('images/afghanistan.pgm');
% model = fliplr_model(model);
% [bb, conf] = abFindObject(img,model,scan);
% figure(3); imshow(bb_burn(img,bb(:,conf>5)),[]); 


