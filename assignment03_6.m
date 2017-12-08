clc;
clear all;
close all;

%% Image 02
% 
% I02rgb = imread('rotor02.jpg');
% I02hsv = rgb2hsv(I02rgb);
% I02 = I02hsv(:,:,3);
% 
% blur02 = edge(I02, 'canny', [0.04 0.6],0.1);
% % imshow(blur02);
% 
% SE1 = strel('line', 3,  0);
% SE2 = strel('line', 2, 90);
% BW02 = imdilate(blur02,[SE1, SE2]);
% 
% BW02fill = imfill(BW02, 'holes');
% BW02noborder = imclearborder(BW02fill,4);
% 
% figure(1)
% imshow(BW02noborder);

%% Image 03

I03rgb = imread('rotor03.jpg');
I03hsv = rgb2hsv(I03rgb);
I03 = I03hsv(:,:,3);

blur03 = edge(I03, 'canny', [0.04 0.6],0.1);

SE1 = strel('line', 3,  0);
SE2 = strel('line', 2, 90);
BW03 = imdilate(blur03,[SE1, SE2]);

BW03fill = imfill(BW03, 'holes');
BW03noborder = imclearborder(BW03fill,4);

[labels, number] = bwlabel(BW03noborder, 8);
Istats = regionprops(labels,'basic');

[values, index] = sort([Istats.Area],'descend');
[maxVal, maxIndex] = max([Istats.Area]);

center = [Istats.BoundingBox(1) + Istats.BoundingBox(3)/2,...
    Istats.BoundingBox(2) + Istats.BoundingBox(4)/2];

diameters = max([Istats.BoundingBox(3) Istats.BoundingBox(4)]);
radii = diameters/2;

figure(2)
imshow(BW03noborder);
hold on
plot(center(1), center(2), 'g*')
hold on
viscircles(center,radii);

%% Image 05

% I05rgb = imread('rotor05.jpg');
% I05hsv = rgb2hsv(I05rgb);
% I05 = I05hsv(:,:,3);
% 
% blur05 = edge(I05, 'canny', [0.04 0.8],0.1);
% 
% SE1 = strel('line', 3,  0);
% SE2 = strel('line', 2, 90);
% BW05 = imdilate(blur05,[SE1, SE2]);
% 
% BW05fill = imfill(BW05, 'holes');
% BW05noborder = imclearborder(BW05fill,4);
% 
% figure(3)
% imshow(BW05noborder);