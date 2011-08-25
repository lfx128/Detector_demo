Running:
---------------------------------------------------------------------------------------
> usbinit    initialized Matlab Image Acquisition toolbox, 
             windows alternative: VCAPG2, http://www.ikko.k.hosei.ac.jp/~matlab/matkatuyo/vcapg2.htm
> go_online  runs detector
> usbinit    clears the video stream


Testing files:
---------------------------------------------------------------------------------------
go_offline ... loads two images and tests frontal and profile detector
go_online  ... runs real-time detector on a input from a webcam
			   requires: Image Acquisition Toolbox

Detector description:
---------------------------------------------------------------------------------------
Detector is implemented as a mex function (compiled for Windows, Linux 32/64bit) and 
called by the following function:

[bb, conf] = abFindObject(img,model,scan);

INPUT:
img ... gray scale image
model . detector
scan .. scan.win_height    = 30;   % minimal bb height
		scan.win_width     = 30;   % minimal bb width
		scan.row_shift     = 3;    % row shift of window, not pixels! 
		scan.col_shift     = 3;    % col shift of window, not pixels! 
		scan.scale         = 1.40; % scale change
		scan.threshold     = 7;    % minimal threshold returned by detector, 
		scan.min_std       = 1;    % minimal std of patch that is considered as face, 
		scan.nms           = 1;    % non maxima suppression, kills multiple detections
		scan.overlap       = .4;   % radius of bb considered as the same spot for NMS

OUTPUT:
bb .... bounding boxes of found objects
conf .. confidences (log likelihood ratio)


Please cite the following paper if you decide to use the code:
----------------------------------------------------------------------------------------
Zdenek Kalal, Jiri Matas, Krystian Mikolajczyk. Weighted Sampling for Large-Scale Boosting, BMVC, 2008



