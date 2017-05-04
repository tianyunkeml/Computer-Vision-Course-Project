refIm = imread('ref.jpg');
refIm = im2single(refIm);
refIm = rgb2gray(refIm);
[new_h new_w] = size(final);
prec = sum(sum(final.*refIm))/sum(sum(final));
recall = sum(sum(final.*refIm))/sum(sum(refIm));
F = (1.3*prec*recall)/(0.3*prec+recall);