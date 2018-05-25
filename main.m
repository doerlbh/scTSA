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
st = 20;

%% use preprocessed scTDA embryo data

data = importdata('Embryo.mapper.tsv');
embryo_all = importdata('Embryo.all.tsv');
timepoints = cell2mat(embryo_all.textdata(2:end,2));

tabulate(timepoints)

inp_3 = data(timepoints == '3', :);
inp_4 = data(timepoints == '4', :);
inp_5 = data(timepoints == '5', :);
inp_6 = data(timepoints == '6', :);
inp_7 = data(timepoints == '7', :);

%% further preprocessing - PCA

max_d = 2;

[coeff,score,latent,tsquared,explained] = pca(data);

dat_3 = score(timepoints == '3',1:max_d);
dat_4 = score(timepoints == '4',1:max_d);
dat_5 = score(timepoints == '5',1:max_d);
dat_6 = score(timepoints == '6',1:max_d);
dat_7 = score(timepoints == '7',1:max_d);

%% data input

% val_prop = 0;
%
% [inp_3, val_3] = dat2mat('data_E3.txt',val_prop);
% [inp_4, val_4] = dat2mat('data_E4.txt',val_prop);
% [inp_5, val_5] = dat2mat('data_E5.txt',val_prop);
% [inp_6, val_6] = dat2mat('data_E6.txt',val_prop);
% [inp_7, val_7] = dat2mat('data_E7.txt',val_prop);

%% data preprocessing (TODO)

% dat_3 = inp_3';
% dat_4 = inp_4';
% dat_5 = inp_5';
% dat_6 = inp_6';
% dat_7 = inp_7';
%
% N = size([dat_3,dat_4,dat_5,dat_6,dat_7],2);

%% JPlex - testing

delta = 0.3;
dmax = 7;

% [BN_3, SC_3] = dat2Plex(dat_3, delta, dmax, ss, st);
% [BN_4, SC_4] = dat2Plex(dat_4, delta, dmax, ss, st);
% [BN_5, SC_5] = dat2Plex(dat_5, delta, dmax, ss, st);
% [BN_6, SC_6] = dat2Plex(dat_6, delta, dmax, ss, st);
% [BN_7, SC_7] = dat2Plex(dat_7, delta, dmax, ss, st);

load BN.mat
load SC.mat

%% plot SC

% errorbar(1:dmax,mean(SC_3),std(SC_3)); hold on
% errorbar(1:dmax,mean(SC_4),std(SC_4));
% errorbar(1:dmax,mean(SC_5),std(SC_5));
% errorbar(1:dmax,mean(SC_6),std(SC_6));
% errorbar(1:dmax,mean(SC_7),std(SC_7));

plot(1:dmax,log(mean(SC_3))); hold on
plot(1:dmax,log(mean(SC_4)));
plot(1:dmax,log(mean(SC_5)));
plot(1:dmax,log(mean(SC_6)));
plot(1:dmax,log(mean(SC_7)));

legend('E3','E4','E5','E6','E7');
xlabel('dimension')
% ylabel('# of complexes')
ylabel('log(# of complexes)')
title('number of simplicial complexes (with n = 50)')

%% plot BN

errorbar(0:dmax-1,mean(BN_3(:,1:dmax)),std(BN_3(:,1:dmax))); hold on
errorbar(0:dmax-1,mean(BN_4(:,1:dmax)),std(BN_4(:,1:dmax)));
errorbar(0:dmax-1,mean(BN_5(:,1:dmax)),std(BN_5(:,1:dmax)));
errorbar(0:dmax-1,mean(BN_6(:,1:dmax)),std(BN_6(:,1:dmax)));
errorbar(0:dmax-1,mean(BN_7(:,1:dmax)),std(BN_7(:,1:dmax)));
legend('E3','E4','E5','E6','E7');
xlabel('Betti number order')
ylabel('Betti number')
title('Betti numbers (with n = 50)')

%% plot BN3 vs. BN1

BN0 = [mean(BN_3(:,2)),mean(BN_4(:,1)),mean(BN_5(:,1)),mean(BN_6(:,1)),mean(BN_7(:,1))];
BN1 = [mean(BN_3(:,2)),mean(BN_4(:,2)),mean(BN_5(:,2)),mean(BN_6(:,2)),mean(BN_7(:,2))];
BN2 = [mean(BN_3(:,2)),mean(BN_4(:,3)),mean(BN_5(:,3)),mean(BN_6(:,3)),mean(BN_7(:,3))];
BN3 = [mean(BN_3(:,2)),mean(BN_4(:,4)),mean(BN_5(:,4)),mean(BN_6(:,4)),mean(BN_7(:,4))];

% plot(BN1(1),BN3(1), 'o'); hold on
% plot(BN1(2),BN3(2), 'o');
% plot(BN1(3),BN3(3), 'o');
% plot(BN1(4),BN3(4), 'o');
% plot(BN1(5),BN3(5), 'o');

E3 = [BN1(1), BN3(1)];
E4 = [BN1(2), BN3(2)];
E5 = [BN1(3), BN3(3)];
E6 = [BN1(4), BN3(4)];
E7 = [BN1(5), BN3(5)];

dp1 = E4 - E3;    
dp2 = E5 - E4;    
dp3 = E6 - E5;    
dp4 = E7 - E6;    

figure
quiver(E3(1),E3(2),dp1(1),dp1(2),0); hold on
quiver(E4(1),E4(2),dp2(1),dp2(2),0); 
quiver(E5(1),E5(2),dp3(1),dp3(2),0); 
quiver(E6(1),E6(2),dp4(1),dp4(2),0);
grid
% axis([0  10  0  10])
text(E3(1),E3(2), sprintf('E3 (%.0f,%.0f)',E3))
text(E4(1),E4(2), sprintf('E4 (%.0f,%.0f)',E4))
text(E5(1),E5(2), sprintf('E5 (%.0f,%.0f)',E5))
text(E6(1),E6(2), sprintf('E6 (%.0f,%.0f)',E6))
text(E7(1),E7(2), sprintf('E7 (%.0f,%.0f)',E7))

xlabel('Betti number 1')
ylabel('Betti number 3')
title('Betti number 3 vs. Betti number 1 (with n = 50)')


%% graphTDA - PH barcodes

% mh = 0;

% [ph_3,best_eps_3,dist_3,eps_3,bar_3] = mat2phb(inp_3, mh, ss, st, 'Euclidean');
% [ph_4,best_eps_4,dist_4,eps_4,bar_4] = mat2phb(dat_4, mh, ss, st, 'Euclidean');
% [ph_5,best_eps_5,dist_5,eps_5,bar_5] = mat2phb(dat_5, mh, ss, st, 'Euclidean');
% [ph_6,best_eps_6,dist_6,eps_6,bar_6] = mat2phb(dat_6, mh, ss, st, 'Euclidean');
% [ph_7,best_eps_7,dist_7,eps_7,bar_7] = mat2phb(dat_7, mh, ss, st, 'Euclidean');

%% graphTDA - n-dim simplicial complexes

% md = max_d(ss);
%
% nsc_3 = mat2nsc(dist_3, best_eps_3, ss, st, md);
% nsc_4 = mat2nsc(dist_4, best_eps_4, ss, st, md);
% nsc_5 = mat2nsc(dist_5, best_eps_5, ss, st, md);
% nsc_6 = mat2nsc(dist_6, best_eps_6, ss, st, md);
% nsc_7 = mat2nsc(dist_7, best_eps_7, ss, st, md);

%% graphTDA - Betti number analysis

% mb = max_b(N);
%
% bna_3 = mat2bna(inp_3, mb);
% bna_4 = mat2bna(inp_4, mb);
% bna_5 = mat2bna(inp_5, mb);
% bna_6 = mat2bna(inp_6, mb);
% bna_7 = mat2bna(inp_7, mb);


%% validation (TODO)
