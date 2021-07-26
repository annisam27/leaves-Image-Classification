[num_train,txt,raw] = xlsread("DataTraining.xlsx",'DataTrain');
[num_kelas,kelas,raw_kelas] = xlsread("DataTraining.xlsx",'Kelas'); 
train = fitcknn(num_train,kelas);
train.Distance = 'euclidean';
img = imread('cabai5.jpg');
imshow(img);

gray = rgb2gray(img);

mf = medfilt2(gray, [5 5]);

bw = im2bw(mf);
%imshow(bw)

SEdis1= strel('disk', 20, 0);
SEdis2= strel('disk', 10, 0 );
SEdis3= strel('disk', 5, 0);
SEdis4= strel('disk', 55, 0);
ero = imerode(bw, SEdis4);

%cc = bwconncomp(dil,4);
re =  imcomplement(ero);
%SE = strel('disk', 3, 0);
cc = bwconncomp(re,4);

adaun(cc.PixelIdxList{1}) = true;
fitur = regionprops(cc,'Area','MajorAxisLength','MinorAxisLength', 'Eccentricity','Perimeter');
data = [fitur(3).Area fitur(3).MajorAxisLength fitur(3).MinorAxisLength fitur(3).Eccentricity fitur(3).Perimeter];
disp (data);

%Prediksi data train dengan data image
hasil = predict(train,data);
disp(hasil());