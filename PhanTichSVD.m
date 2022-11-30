clear all;
clc;
syms X;
in_address = 'FLAME.jpg';
out_address = 'output.jpg';
if (exist(in_address) == 2)
%open original image and convert it into gray colormap
%Here we use a MRI scan as original image
X = rgb2gray(imread(in_address));
X = im2double(X);
figure;
subplot(2, 4,1),
imshow(X);
title('Original Image');
else
disp('File does not exist');
end
%Reconstruct image using SVD
%Function SVD
M = X;
Mt = transpose(M);  
MtM = Mt*M;         %nxn
MMt = M*Mt;         %mxm
sizeOfMatrix = size(M);    
run = 1;
[V,S] = eig(MtM);
while(run==1)
for i=1: (sizeOfMatrix(2)-1)
    run = 0;
    if S(i,i) <= S(i+1,i+1)
        run = 1;
        temp = S(i,i);
        S(i,i) = S(i+1,i+1);
        S(i+1,i+1) = temp;
        for j=1:sizeOfMatrix(2)
            temp = V(j,i);
            V(j,i) = V(j,i+1);
            V(j,i+1) = temp;
        end
    end
end
for i=1: (sizeOfMatrix(2)-1)
    if S(i,i) <= S(i+1,i+1)
        run = 1;
    end
end
end
%M = U*S*Vt =>>> U = M*V*S^-1
 S = abs(S);
 S = S^(1/2);
 invertS = S^(-1);
 U = M*V*invertS;
%End function SVD
sigmas = diag(S);
%sigmas is a vector contain S(i,i) of the S matrix
%Problem
disp('Chung ta thu khoi phuc lai anh ban dau voi ma tran S co bac ngau nhien k');
ranks = [20, 50, 100, 150, 250, 300, 450];
for i = 1:length(ranks)
approx_sigmas = sigmas;
ns = length(sigmas);
approx_sigmas(ranks(i):end) = 0;
approx_S = S;
approx_S(1:ns,1:ns) = diag(approx_sigmas);
approx_img = U * approx_S * V';
subplot(2, 4, i+1),
imshow(approx_img);
title(sprintf('Tuncate by r = %d', ranks(i)));
end
