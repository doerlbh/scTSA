% dat2mat
% extract a processable matrix from data

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

function [inp, val] = dat2mat(filename,p)

data = importdata(filename);
N = size(data,2);
data = data(:,randperm(N));
select = int64(N*p);
val = data(:,1:select);
inp = data(:,select+1:end);

end