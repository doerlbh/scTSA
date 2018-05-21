% graphTDA

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

clear all; close all;
addpath('/Users/DoerLBH/Dropbox/git/graphTDA');

%% data input

val_prop = 0.1;

[inp_3, val_3] = dat2mat('data_E3.txt',val_prop);
[inp_4, val_4] = dat2mat('data_E4.txt',val_prop);
[inp_5, val_5] = dat2mat('data_E5.txt',val_prop);
[inp_6, val_6] = dat2mat('data_E6.txt',val_prop);
[inp_7, val_7] = dat2mat('data_E7.txt',val_prop);

%% data preprocessing (TODO)

dat_3 = inp_3;
dat_4 = inp_4;
dat_5 = inp_5;
dat_6 = inp_6;
dat_7 = inp_7;

N = size([dat_3,dat_4,dat_5,dat_6,dat_7],2);

%% graphTDA - PH barcodes

mh = max_h(N);

bar_3 = mat2phb(dat_3, mh);
bar_4 = mat2phb(dat_4, mh);
bar_5 = mat2phb(dat_5, mh);
bar_6 = mat2phb(dat_6, mh);
bar_7 = mat2phb(dat_7, mh);


%% graphTDA - n-dim simplicial complexes

md = max_d(N);

nsc_3 = mat2nsc(dat_3, md);
nsc_4 = mat2nsc(dat_4, md);
nsc_5 = mat2nsc(dat_5, md);
nsc_6 = mat2nsc(dat_6, md);
nsc_7 = mat2nsc(dat_7, md);

%% graphTDA - Betti number analysis

mb = max_b(N);

bna_3 = mat2bna(dat_3, mb);
bna_4 = mat2bna(dat_4, mb);
bna_5 = mat2bna(dat_5, mb);
bna_6 = mat2bna(dat_6, mb);
bna_7 = mat2bna(dat_7, mb);


%% validation (TODO)
