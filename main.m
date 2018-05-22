% graphTDA

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

clear all; close all;
addpath('/Users/DoerLBH/Dropbox/git/graphTDA');
addpath('/Users/DoerLBH/Dropbox/git/graphTDA/JPlex');
startJPlex

% subsampling
ss = 50;
st = 100;

%% data input

val_prop = 0;

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

%% JPlex - testing

pdata_E3 = EuclideanArrayData(dat_3');
pdata_E3.count
pdata_E3.dimension

L = WitnessStream.makeRandomLandmarks(pdata_E3, ss);
R = WitnessStream.estimateRmax(pdata_E3, L);

dmax = 3;
tmax = R/2;

wit_E3 = Plex.WitnessStream(0.01, dmax, tmax, L, pdata_E3);

wit_E3.size

intervals = Plex.Persistence.computeIntervals(wit_E3);
Plex.plot(intervals, 'wit_E3', tmax)

wit_E3_Expl = Plex.makeExplicit(wit_E3);
intervals = Plex.Persistence.computeIntervals(wit_E3_Expl);
Plex.FilterInfinite(intervals)

size(wit_E3_Expl.dump(3).C)

%% graphTDA - PH barcodes

% mh = max_h(N);
mh = 0;

[ph_3,best_eps_3,dist_3,eps_3,bar_3] = mat2phb(dat_3, mh, ss, st, 'Euclidean');
% [ph_4,best_eps_4,dist_4,eps_4,bar_4] = mat2phb(dat_4, mh, ss, st, 'Euclidean'); 
% [ph_5,best_eps_5,dist_5,eps_5,bar_5] = mat2phb(dat_5, mh, ss, st, 'Euclidean');
% [ph_6,best_eps_6,dist_6,eps_6,bar_6] = mat2phb(dat_6, mh, ss, st, 'Euclidean');
% [ph_7,best_eps_7,dist_7,eps_7,bar_7] = mat2phb(dat_7, mh, ss, st, 'Euclidean');

%% graphTDA - n-dim simplicial complexes

md = max_d(ss);

nsc_3 = mat2nsc(dist_3, best_eps_3, ss, st, md);
nsc_4 = mat2nsc(dist_4, best_eps_4, ss, st, md);
nsc_5 = mat2nsc(dist_5, best_eps_5, ss, st, md);
nsc_6 = mat2nsc(dist_6, best_eps_6, ss, st, md);
nsc_7 = mat2nsc(dist_7, best_eps_7, ss, st, md);

%% graphTDA - Betti number analysis

mb = max_b(N);

bna_3 = mat2bna(dat_3, mb);
bna_4 = mat2bna(dat_4, mb);
bna_5 = mat2bna(dat_5, mb);
bna_6 = mat2bna(dat_6, mb);
bna_7 = mat2bna(dat_7, mb);


%% validation (TODO)
