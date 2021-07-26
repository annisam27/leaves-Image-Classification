a1 = imread('jeruk5.jpg');
a2 = imread('jeruk2.jpg');
b1 = imread('kelengkeng1.jpg');
b2 = imread('kelengkeng2.jpg');
c1 = imread('mawar1.jpg');
c2 = imread('mawar2.jpg');
d1 = imread('melati1.jpg');
d2 = imread('melati2.jpg');
e1 = imread('cabai1.jpg');
e2 = imread('cabai2.jpg');

%menampilkan gambar
%imshow([b1 b2])
%imshow([c1 c2])
%imshow([d3 d2])

%imshow([a1 b1 c1 d1 e1])
%imshow(d5);


%mengubah image menjadi grayscale
%Train daun A
grayA1 = rgb2gray(a1);
grayA2 = rgb2gray(a2);
%Train daun B
grayB1 = rgb2gray(b1);
grayB2 = rgb2gray(b2);
%Train daun C
grayC1 = rgb2gray(c1);
grayC2 = rgb2gray(c2);
%Train daun D
grayD1 = rgb2gray(d1);
grayD2 = rgb2gray(d2);
%Train daun E
grayE1 = rgb2gray(e1);
grayE2 = rgb2gray(e2);
%Menampilkan hasil dari grayscale image
%figure, imshow([grayA1 grayA2 grayA3]);

%Median filter
%train Daun A
mfA1 = medfilt2(grayA1, [5 5]);
mfA2 = medfilt2(grayA2, [5 5]);
%train Daun B
mfB1 = medfilt2(grayB1, [5 5]);
mfB2 = medfilt2(grayB2, [5 5]);
%train Daun C
mfC1 = medfilt2(grayC1, [5 5]);
mfC2 = medfilt2(grayC2, [5 5]);
%train Daun D
mfD1 = medfilt2(grayD1, [5 5]);
mfD2 = medfilt2(grayD2, [5 5]);
%train Daun E
mfE1 = medfilt2(grayE1, [5 5]);
mfE2 = medfilt2(grayE2, [5 5]);

%menampilkan median filter dan membandingkan dengan grayscale
%figure, imshow([grayA1 mfA1 ]);
%figure, imshow([grayB2 mfB2 ]);

%Binary(Hitam putih)
%train Daun A
bwA1 = im2bw(mfA1);
bwA2 = im2bw(mfA2);
%train Daun B
bwB1 = im2bw(mfB1);
bwB2 = im2bw(mfB2);
%train Daun C
bwC1 = im2bw(mfC1);
bwC2 = im2bw(mfC2);
%train Daub D
bwD1 = im2bw(mfD1);
bwD2 = im2bw(mfD2);
%train Daun E
bwE1 = im2bw(mfE1);
bwE2 = im2bw(mfE2);

%menampilkan binary
%figure, imshow(bwA1)
%figure, imshow([bwA1 bwA2 bwA3]);
%figure, imshow([bwB2 bwB3])

%erosi citra
SEdis1= strel('disk', 20, 0);
SEdis2= strel('disk', 10, 0 );
SEdis3= strel('disk', 5, 0);
SEdis4= strel('disk', 55, 0);

%train Daun A
eroA1 = imerode(bwA1, SEdis1);
eroA2 = imerode(bwA2, SEdis1);
%train Daun B
eroB1 = imerode(bwB1, SEdis1);
eroB2 = imerode(bwB2, SEdis1);
%train Daun C
eroC1 = imerode(bwC1, SEdis2);
eroC2 = imerode(bwC2, SEdis1);
%train Daun D
eroD1 = imerode(bwD1, SEdis4);
eroD2 = imerode(bwD2, SEdis4);
%train Daun E
eroE1 = imerode(bwE1, SEdis2);
eroE2 = imerode(bwE2, SEdis2);

%Menampilkan hasil erosi
%figure, imshow([eroA1 eroA2 eroA3]);
%figure, imshow([eroB1 eroB2 eroB3]);
%figure, imshow([eroC1 eroC2 eroC3]);
%figure, imshow([eroD1 eroD2 eroD3]);
%figure, imshow([eroE1 eroE2 eroE3]);

%Reverse citra
%Daun A
reA1 =  imcomplement(eroA1);
reA2 =  imcomplement(eroA2);
%Daun B
reB1 =  imcomplement(eroB1);
reB2 =  imcomplement(eroB2);
%Daun C
reC1 =  imcomplement(eroC1);
reC2 =  imcomplement(eroC2);
%Daun D 
reD1 =  imcomplement(eroD1);
reD2 =  imcomplement(eroD2);
%Daun E
reE1 =  imcomplement(eroE1);
reE2 =  imcomplement(eroE2);

%menampilkan hasil reverse
%figure, imshow([reE1 reE2]);

%Menampilkan setiap proses
%figure, imshow(reE1);
%figure, imshow(eroC2);
%figure, imshow(bwC2);
%figure, imshow(grayC2);
%figure, imshow(c2);

%Mndapatkan Fitur image
%ubah variabel pada fungsing bwconcomp
%dengan variabel hasil reverse image
cc = bwconncomp(reE2,4);
adaun(cc.PixelIdxList{1}) = true;
getFeature = regionprops(cc,'Area','MajorAxisLength','MinorAxisLength', 'Eccentricity', 'Perimeter');
disp(getFeature(3));
aa = struct2table(getFeature(3));
%filename = 'data_train.xlsx';
%writetable(aa,filename,'Sheet',1,'Range','A29');
