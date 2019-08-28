%%将视频转换成帧图片
clc;
clear;
%% 读取视频
fileFolder = 'C:\Users\Liu\Desktop\时序循环去运动网络\Dataset\DeepVideoDeblurring_Dataset\testing_set\';
saveFolder0 = 'C:\Users\Liu\Desktop\时序循环去运动网络\Dataset\DeepVideoDeblurring_Dataset\testing_set\blur0\';
saveFolder1 = 'C:\Users\Liu\Desktop\时序循环去运动网络\Dataset\DeepVideoDeblurring_Dataset\testing_set\blur1\';
saveFolder2 = 'C:\Users\Liu\Desktop\时序循环去运动网络\Dataset\DeepVideoDeblurring_Dataset\testing_set\blur2\';
saveFolder3 = 'C:\Users\Liu\Desktop\时序循环去运动网络\Dataset\DeepVideoDeblurring_Dataset\testing_set\sharp\';
image_list = dir(strcat(fileFolder,'*.jpg'));
image_num = length(image_list);%获取图像总数量
if image_num > 0 %有满足条件的图像
    for j=1:image_num
        name = image_list(j).name;% 视频名
        img = imread(fullfile(fileFolder,name));
        disp(strcat('Processing image:', name));
        w = size(img,2)/2;
        h = size(img,1)/2;
        blur0 = imcrop(img,[1 1  w-1 h-1]);
        blur1 = imcrop(img,[w+1 1  w-1 h-1]);
        blur2 = imcrop(img,[1 h+1 w-1 h-1]);
        sharp = imcrop(img,[w+1 h+1 w-1 h-1]);
        imwrite(blur0,strcat(saveFolder0, name),'jpg');
        imwrite(blur1,strcat(saveFolder1, name),'jpg');
        imwrite(blur2,strcat(saveFolder2, name),'jpg');
        imwrite(sharp,strcat(saveFolder3, name),'jpg');
        %imwrite(img_1x2,strcat(saveFolder2, name),'jpg');
    end
end