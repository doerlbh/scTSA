% graphTDA

% Author:       Baihan Lin
% Date:         07/2019

clear all; close all;

cd /Users/DoerLBH/Dropbox/git/graphTDA/matlab_javaplex
load_javaplex
import edu.stanford.math.plex4.*;

cd /Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev
addpath('/Users/DoerLBH/Dropbox/git/graphTDA');
addpath('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev')
addpath('/Users/DoerLBH/Dropbox/git/graphTDA/javaplex-4.3.4');
addpath('/Users/DoerLBH/Dropbox/git/graphTDA/matlab_javaplex');

%% use preprocessed scTDA embryo data

data_all = importdata('zebrafish_Regev.mapper.tsv');
data = data_all.data;
clear data_all
% embryo_all = importdata('zebrafish_Regev.all.tsv');
timepoints = importdata('time.txt');

tabulate(timepoints)

% embryo_all = importdata('zebrafish_Regev.all.tsv');
% lineages = embryo_all.textdata(2:end,3);
% 
% clear embryo_all
% 
% filePh = fopen('lineages-list.txt','a');
% for t = 1:length(lineages)
%     fprintf(filePh,'%s\n',lineages{t});
% end
% fclose(filePh);

lineages = importdata('lineages-list.txt');
tabulate(lineages)

%% for timepoints 

dat_T1 = data(timepoints == 1,:);
dat_T2 = data(timepoints == 2,:);
dat_T3 = data(timepoints == 3,:);
dat_T4 = data(timepoints == 4,:);
dat_T5 = data(timepoints == 5,:);
dat_T6 = data(timepoints == 6,:);
dat_T7 = data(timepoints == 7,:);
dat_T8 = data(timepoints == 8,:);
dat_T9 = data(timepoints == 9,:);
dat_T10 = data(timepoints == 10,:);
dat_T11 = data(timepoints == 11,:);
dat_T12 = data(timepoints == 12,:);

%% for lineages

dat_L1 = data(strcmp(lineages, 'Lineage_Spinal_Cord'),:);
dat_L2 = data(strcmp(lineages, 'Lineage_Diencephalon'),:);
dat_L3 = data(strcmp(lineages, 'Lineage_Optic_Cup'),:);
dat_L4 = data(strcmp(lineages, 'Lineage_Midbrain_Neural_Crest'),:);
dat_L5 = data(strcmp(lineages, 'Lineage_Hindbrain_R3'),:);
dat_L6 = data(strcmp(lineages, 'Lineage_Hindbrain_R4_5_6'),:);
dat_L7 = data(strcmp(lineages, 'Lineage_Telencephalon'),:);
dat_L8 = data(strcmp(lineages, 'Lineage_Epidermis'),:);
dat_L9 = data(strcmp(lineages, 'Lineage_Neural_Plate_Border'),:);
dat_L10 = data(strcmp(lineages, 'Lineage_Placode_Adeno._Lens_Trigeminal'),:);
dat_L11 = data(strcmp(lineages, 'Lineage_Placode_Epibranchial_Otic'),:);
dat_L12 = data(strcmp(lineages, 'Lineage_Placode_Olfactory'),:);
dat_L13 = data(strcmp(lineages, 'Lineage_Tailbud'),:);
dat_L14 = data(strcmp(lineages, 'Lineage_Adaxial_Cells'),:);
dat_L15 = data(strcmp(lineages, 'Lineage_Somites'),:);
dat_L16 = data(strcmp(lineages, 'Lineage_Hematopoeitic_ICM'),:);
dat_L17 = data(strcmp(lineages, 'Lineage_Hematopoeitic_RBI_Pronephros'),:);
dat_L18 = data(strcmp(lineages, 'Lineage_Endoderm_Pharyngeal'),:);
dat_L19 = data(strcmp(lineages, 'Lineage_Endoderm_Pancreatic_Intestinal'),:);
dat_L20 = data(strcmp(lineages, 'Lineage_Heart_Primordium'),:);
dat_L21 = data(strcmp(lineages, 'Lineage_Cephalic_Mesoderm'),:);
dat_L22 = data(strcmp(lineages, 'Lineage_Prechordal_Plate'),:);
dat_L23 = data(strcmp(lineages, 'Lineage_Notochord'),:);
dat_L24 = data(strcmp(lineages, 'Lineage_Primordial_Germ_Cells'),:);
dat_L25 = data(strcmp(lineages, 'Lineage_EVL'),:);
dat_plu = data(strcmp(lineages, 'undefined'),:);
dat_und = data(strcmp(lineages, 'pluripotent'),:);

%% Filtration for time - MDS

ss = 100; % sample size
st = 10; % number of runs
dmax = 7;

rng(1)

[BN_T1, SC_T1] = dat2Filtration(dat_T1,dmax,ss,st,'mds','T1',2,false);
[BN_T2, SC_T2] = dat2Filtration(dat_T2,dmax,ss,st,'mds','T2',2,false);
[BN_T3, SC_T3] = dat2Filtration(dat_T3,dmax,ss,st,'mds','T3',2,false);
[BN_T4, SC_T4] = dat2Filtration(dat_T4,dmax,ss,st,'mds','T4',2,false);
[BN_T5, SC_T5] = dat2Filtration(dat_T5,dmax,ss,st,'mds','T5',2,false);
[BN_T6, SC_T6] = dat2Filtration(dat_T6,dmax,ss,st,'mds','T6',2,false);
[BN_T7, SC_T7] = dat2Filtration(dat_T7,dmax,ss,st,'mds','T7',2,false);
[BN_T8, SC_T8] = dat2Filtration(dat_T8,dmax,ss,st,'mds','T8',2,false);
[BN_T9, SC_T9] = dat2Filtration(dat_T9,dmax,ss,st,'mds','T9',2,false);
[BN_T10, SC_T10] = dat2Filtration(dat_T10,dmax,ss,st,'mds','T10',2,false);
[BN_T11, SC_T11] = dat2Filtration(dat_T11,dmax,ss,st,'mds','T11',2,false);
[BN_T12, SC_T12] = dat2Filtration(dat_T12,dmax,ss,st,'mds','T12',2,false);

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/BN_T_MDS_100.mat','BN_T1','BN_T2','BN_T3','BN_T4','BN_T5','BN_T6','BN_T7','BN_T8','BN_T9','BN_T10','BN_T11','BN_T12');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/SC_T_MDS_100.mat','SC_T1','SC_T2','SC_T3','SC_T4','SC_T5','SC_T6','SC_T7','SC_T8','SC_T9','SC_T10','SC_T11','SC_T12');

% load BN.mat
% load SC.mat


%% Filtration for time - PCA

ss = 50; % sample size
st = 10; % number of runs
dmax = 7;

rng(1)

[BN_T1, SC_T1] = dat2Filtration(dat_T1,dmax,ss,st,'pca','T1',2,false);
[BN_T2, SC_T2] = dat2Filtration(dat_T2,dmax,ss,st,'pca','T2',2,false);
[BN_T3, SC_T3] = dat2Filtration(dat_T3,dmax,ss,st,'pca','T3',2,false);
[BN_T4, SC_T4] = dat2Filtration(dat_T4,dmax,ss,st,'pca','T4',2,false);
[BN_T5, SC_T5] = dat2Filtration(dat_T5,dmax,ss,st,'pca','T5',2,false);
[BN_T6, SC_T6] = dat2Filtration(dat_T6,dmax,ss,st,'pca','T6',2,false);
[BN_T7, SC_T7] = dat2Filtration(dat_T7,dmax,ss,st,'pca','T7',2,false);
[BN_T8, SC_T8] = dat2Filtration(dat_T8,dmax,ss,st,'pca','T8',2,false);
[BN_T9, SC_T9] = dat2Filtration(dat_T9,dmax,ss,st,'pca','T9',2,false);
[BN_T10, SC_T10] = dat2Filtration(dat_T10,dmax,ss,st,'pca','T10',2,false);
[BN_T11, SC_T11] = dat2Filtration(dat_T11,dmax,ss,st,'pca','T11',2,false);
[BN_T12, SC_T12] = dat2Filtration(dat_T12,dmax,ss,st,'pca','T12',2,false);

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/BN_T_PCA_50.mat','BN_T1','BN_T2','BN_T3','BN_T4','BN_T5','BN_T6','BN_T7','BN_T8','BN_T9','BN_T10','BN_T11','BN_T12');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/SC_T_PCA_50.mat','SC_T1','SC_T2','SC_T3','SC_T4','SC_T5','SC_T6','SC_T7','SC_T8','SC_T9','SC_T10','SC_T11','SC_T12');

% load BN.mat
% load SC.mat

%% Filtration for lineages

ss = 50; % sample size
st = 10; % number of runs
dmax = 7;

[BN_L1, SC_L1] = dat2Filtration(dat_L1,dmax,ss,st,'mds','L1',2,false);
[BN_L2, SC_L2] = dat2Filtration(dat_L2,dmax,ss,st,'mds','L2',2,false);
[BN_L3, SC_L3] = dat2Filtration(dat_L3,dmax,ss,st,'mds','L3',2,false);
[BN_L4, SC_L4] = dat2Filtration(dat_L4,dmax,ss,st,'mds','L4',2,false);
[BN_L5, SC_L5] = dat2Filtration(dat_L5,dmax,ss,st,'mds','L5',2,false);
[BN_L6, SC_L6] = dat2Filtration(dat_L6,dmax,ss,st,'mds','L6',2,false);
[BN_L7, SC_L7] = dat2Filtration(dat_L7,dmax,ss,st,'mds','L7',2,false);
[BN_L8, SC_L8] = dat2Filtration(dat_L8,dmax,ss,st,'mds','L8',2,false);
[BN_L9, SC_L9] = dat2Filtration(dat_L9,dmax,ss,st,'mds','L9',2,false);
[BN_L10, SC_L10] = dat2Filtration(dat_L10,dmax,ss,st,'mds','L10',2,false);
[BN_L11, SC_L11] = dat2Filtration(dat_L11,dmax,ss,st,'mds','L11',2,false);
[BN_L12, SC_L12] = dat2Filtration(dat_L12,dmax,ss,st,'mds','L12',2,false);
[BN_L13, SC_L13] = dat2Filtration(dat_L13,dmax,ss,st,'mds','L13',2,false);
[BN_L14, SC_L14] = dat2Filtration(dat_L14,dmax,ss,st,'mds','L14',2,false);
[BN_L15, SC_L15] = dat2Filtration(dat_L15,dmax,ss,st,'mds','L15',2,false);
[BN_L16, SC_L16] = dat2Filtration(dat_L16,dmax,ss,st,'mds','L16',2,false);
[BN_L17, SC_L17] = dat2Filtration(dat_L17,dmax,ss,st,'mds','L17',2,false);
[BN_L18, SC_L18] = dat2Filtration(dat_L18,dmax,ss,st,'mds','L18',2,false);
[BN_L19, SC_L19] = dat2Filtration(dat_L19,dmax,ss,st,'mds','L19',2,false);
[BN_L20, SC_L20] = dat2Filtration(dat_L20,dmax,ss,st,'mds','L20',2,false);
[BN_L21, SC_L21] = dat2Filtration(dat_L21,dmax,ss,st,'mds','L21',2,false);
[BN_L22, SC_L22] = dat2Filtration(dat_L22,dmax,ss,st,'mds','L22',2,false);
[BN_L23, SC_L23] = dat2Filtration(dat_L23,dmax,ss,st,'mds','L23',2,false);
[BN_L24, SC_L24] = dat2Filtration(dat_L24,dmax,ss,st,'mds','L24',2,false);
[BN_L25, SC_L25] = dat2Filtration(dat_L25,dmax,ss,st,'mds','L25',2,false);
[BN_und, SC_und] = dat2Filtration(dat_und,dmax,ss,st,'mds','und',2,false);
[BN_plu, SC_plu] = dat2Filtration(dat_plu,dmax,ss,st,'mds','plu',2,false);

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/BN_L_MDS_50.mat','BN_L1','BN_L2','BN_L3','BN_L4','BN_L5','BN_L6','BN_L7','BN_L8','BN_L9','BN_L10','BN_L11','BN_L12','BN_L13','BN_L14','BN_L15','BN_L16','BN_L17','BN_L18','BN_L19','BN_L20','BN_L21','BN_L22','BN_L23','BN_L24','BN_L25','BN_und','BN_plu');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/SC_L_MDS_50.mat','SC_L1','SC_L2','SC_L3','SC_L4','SC_L5','SC_L6','SC_L7','SC_L8','SC_L9','SC_L10','SC_L11','SC_L12','SC_L13','SC_L14','SC_L15','SC_L16','SC_L17','SC_L18','SC_L19','SC_L20','SC_L21','SC_L22','SC_L23','SC_L24','SC_L25','SC_und','SC_plu');

% load BN.mat
% load SC.mat


%% Filtration for time - null model

ss = 100; % sample size
st = 10; % number of runs
dmax = 7;

rng(1)

[null_BN_T1, null_SC_T1] = dat2Filtration(dat_T1,dmax,ss,st,'mds','null-T1',2,true);
[null_BN_T2, null_SC_T2] = dat2Filtration(dat_T2,dmax,ss,st,'mds','null-T2',2,true);
[null_BN_T3, null_SC_T3] = dat2Filtration(dat_T3,dmax,ss,st,'mds','null-T3',2,true);
[null_BN_T4, null_SC_T4] = dat2Filtration(dat_T4,dmax,ss,st,'mds','null-T4',2,true);
[null_BN_T5, null_SC_T5] = dat2Filtration(dat_T5,dmax,ss,st,'mds','null-T5',2,true);
[null_BN_T6, null_SC_T6] = dat2Filtration(dat_T6,dmax,ss,st,'mds','null-T6',2,true);
[null_BN_T7, null_SC_T7] = dat2Filtration(dat_T7,dmax,ss,st,'mds','null-T7',2,true);
[null_BN_T8, null_SC_T8] = dat2Filtration(dat_T8,dmax,ss,st,'mds','null-T8',2,true);
[null_BN_T9, null_SC_T9] = dat2Filtration(dat_T9,dmax,ss,st,'mds','null-T9',2,true);
[null_BN_T10, null_SC_T10] = dat2Filtration(dat_T10,dmax,ss,st,'mds','null-T10',2,true);
[null_BN_T11, null_SC_T11] = dat2Filtration(dat_T11,dmax,ss,st,'mds','null-T11',2,true);
[null_BN_T12, null_SC_T12] = dat2Filtration(dat_T12,dmax,ss,st,'mds','null-T12',2,true);

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/null_BN_T_MDS_100.mat','null_BN_T1','null_BN_T2','null_BN_T3','null_BN_T4','null_BN_T5','null_BN_T6','null_BN_T7','null_BN_T8','null_BN_T9','null_BN_T10','null_BN_T11','null_BN_T12');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/null_SC_T_MDS_100.mat','null_SC_T1','null_SC_T2','null_SC_T3','null_SC_T4','null_SC_T5','null_SC_T6','null_SC_T7','null_SC_T8','null_SC_T9','null_SC_T10','null_SC_T11','null_SC_T12');

% load null_BN.mat
% load null_SC.mat

%% Filtration for lineages - null model

ss = 50; % sample size
st = 10; % number of runs
dmax = 7;

[null_BN_L1, null_SC_L1] = dat2Filtration(dat_L1,dmax,ss,st,'mds','null-L1',2,true);
[null_BN_L2, null_SC_L2] = dat2Filtration(dat_L2,dmax,ss,st,'mds','null-L2',2,true);
[null_BN_L3, null_SC_L3] = dat2Filtration(dat_L3,dmax,ss,st,'mds','null-L3',2,true);
[null_BN_L4, null_SC_L4] = dat2Filtration(dat_L4,dmax,ss,st,'mds','null-L4',2,true);
[null_BN_L5, null_SC_L5] = dat2Filtration(dat_L5,dmax,ss,st,'mds','null-L5',2,true);
[null_BN_L6, null_SC_L6] = dat2Filtration(dat_L6,dmax,ss,st,'mds','null-L6',2,true);
[null_BN_L7, null_SC_L7] = dat2Filtration(dat_L7,dmax,ss,st,'mds','null-L7',2,true);
[null_BN_L8, null_SC_L8] = dat2Filtration(dat_L8,dmax,ss,st,'mds','null-L8',2,true);
[null_BN_L9, null_SC_L9] = dat2Filtration(dat_L9,dmax,ss,st,'mds','null-L9',2,true);
[null_BN_L10, null_SC_L10] = dat2Filtration(dat_L10,dmax,ss,st,'mds','null-L10',2,true);
[null_BN_L11, null_SC_L11] = dat2Filtration(dat_L11,dmax,ss,st,'mds','null-L11',2,true);
[null_BN_L12, null_SC_L12] = dat2Filtration(dat_L12,dmax,ss,st,'mds','null-L12',2,true);
[null_BN_L13, null_SC_L13] = dat2Filtration(dat_L13,dmax,ss,st,'mds','null-L13',2,true);
[null_BN_L14, null_SC_L14] = dat2Filtration(dat_L14,dmax,ss,st,'mds','null-L14',2,true);
[null_BN_L15, null_SC_L15] = dat2Filtration(dat_L15,dmax,ss,st,'mds','null-L15',2,true);
[null_BN_L16, null_SC_L16] = dat2Filtration(dat_L16,dmax,ss,st,'mds','null-L16',2,true);
[null_BN_L17, null_SC_L17] = dat2Filtration(dat_L17,dmax,ss,st,'mds','null-L17',2,true);
[null_BN_L18, null_SC_L18] = dat2Filtration(dat_L18,dmax,ss,st,'mds','null-L18',2,true);
[null_BN_L19, null_SC_L19] = dat2Filtration(dat_L19,dmax,ss,st,'mds','null-L19',2,true);
[null_BN_L20, null_SC_L20] = dat2Filtration(dat_L20,dmax,ss,st,'mds','null-L20',2,true);
[null_BN_L21, null_SC_L21] = dat2Filtration(dat_L21,dmax,ss,st,'mds','null-L21',2,true);
[null_BN_L22, null_SC_L22] = dat2Filtration(dat_L22,dmax,ss,st,'mds','null-L22',2,true);
[null_BN_L23, null_SC_L23] = dat2Filtration(dat_L23,dmax,ss,st,'mds','null-L23',2,true);
[null_BN_L24, null_SC_L24] = dat2Filtration(dat_L24,dmax,ss,st,'mds','null-L24',2,true);
[null_BN_L25, null_SC_L25] = dat2Filtration(dat_L25,dmax,ss,st,'mds','null-L25',2,true);
[null_BN_und, null_SC_und] = dat2Filtration(dat_und,dmax,ss,st,'mds','null-und',2,true);
[null_BN_plu, null_SC_plu] = dat2Filtration(dat_plu,dmax,ss,st,'mds','null-plu',2,true);

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/null_BN_L_MDS_50.mat','null_BN_L1','null_BN_L2','null_BN_L3','null_BN_L4','null_BN_L5','null_BN_L6','null_BN_L7','null_BN_L8','null_BN_L9','null_BN_L10','null_BN_L11','null_BN_L12','null_BN_L13','null_BN_L14','null_BN_L15','null_BN_L16','null_BN_L17','null_BN_L18','null_BN_L19','null_BN_L20','null_BN_L21','null_BN_L22','null_BN_L23','null_BN_L24','null_BN_L25','null_BN_und','null_BN_plu');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/null_SC_L_MDS_50.mat','null_SC_L1','null_SC_L2','null_SC_L3','null_SC_L4','null_SC_L5','null_SC_L6','null_SC_L7','null_SC_L8','null_SC_L9','null_SC_L10','null_SC_L11','null_SC_L12','null_SC_L13','null_SC_L14','null_SC_L15','null_SC_L16','null_SC_L17','null_SC_L18','null_SC_L19','null_SC_L20','null_SC_L21','null_SC_L22','null_SC_L23','null_SC_L24','null_SC_L25','null_SC_und','null_SC_plu');

% load null_BN.mat
% load null_SC.mat

%% normalized by null

score_BN_T1 = BN_T1./null_BN_T1;
score_BN_T2 = BN_T2./null_BN_T2;
score_BN_T3 = BN_T3./null_BN_T3;
score_BN_T4 = BN_T4./null_BN_T4;
score_BN_T5 = BN_T5./null_BN_T5;
score_BN_T6 = BN_T6./null_BN_T6;
score_BN_T7 = BN_T7./null_BN_T7;
score_BN_T8 = BN_T8./null_BN_T8;
score_BN_T9 = BN_T9./null_BN_T9;
score_BN_T10 = BN_T10./null_BN_T10;
score_BN_T11 = BN_T11./null_BN_T11;
score_BN_T12 = BN_T12./null_BN_T12;

score_SC_T1 = SC_T1./null_SC_T1;
score_SC_T2 = SC_T2./null_SC_T2;
score_SC_T3 = SC_T3./null_SC_T3;
score_SC_T4 = SC_T4./null_SC_T4;
score_SC_T5 = SC_T5./null_SC_T5;
score_SC_T6 = SC_T6./null_SC_T6;
score_SC_T7 = SC_T7./null_SC_T7;
score_SC_T8 = SC_T8./null_SC_T8;
score_SC_T9 = SC_T9./null_SC_T9;
score_SC_T10 = SC_T10./null_SC_T10;
score_SC_T11 = SC_T11./null_SC_T11;
score_SC_T12 = SC_T12./null_SC_T12;

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/score_BN_T_MDS_100.mat','score_BN_T1','score_BN_T2','score_BN_T3','score_BN_T4','score_BN_T5','score_BN_T6','score_BN_T7','score_BN_T8','score_BN_T9','score_BN_T10','score_BN_T11','score_BN_T12');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/score_SC_T_MDS_100.mat','score_SC_T1','score_SC_T2','score_SC_T3','score_SC_T4','score_SC_T5','score_SC_T6','score_SC_T7','score_SC_T8','score_SC_T9','score_SC_T10','score_SC_T11','score_SC_T12');

%%

score_BN_L1 = BN_L1./null_BN_L1;
score_BN_L2 = BN_L2./null_BN_L2;
score_BN_L3 = BN_L3./null_BN_L3;
score_BN_L4 = BN_L4./null_BN_L4;
score_BN_L5 = BN_L5./null_BN_L5;
score_BN_L6 = BN_L6./null_BN_L6;
score_BN_L7 = BN_L7./null_BN_L7;
score_BN_L8 = BN_L8./null_BN_L8;
score_BN_L9 = BN_L9./null_BN_L9;
score_BN_L10 = BN_L10./null_BN_L10;
score_BN_L11 = BN_L11./null_BN_L11;
score_BN_L12 = BN_L12./null_BN_L12;
score_BN_L13 = BN_L13./null_BN_L13;
score_BN_L14 = BN_L14./null_BN_L14;
score_BN_L15 = BN_L15./null_BN_L15;
score_BN_L16 = BN_L16./null_BN_L16;
score_BN_L17 = BN_L17./null_BN_L17;
score_BN_L18 = BN_L18./null_BN_L18;
score_BN_L19 = BN_L19./null_BN_L19;
score_BN_L20 = BN_L20./null_BN_L20;
score_BN_L21 = BN_L21./null_BN_L21;
score_BN_L22 = BN_L22./null_BN_L22;
score_BN_L23 = BN_L23./null_BN_L23;
score_BN_L24 = BN_L24./null_BN_L24;
score_BN_L25 = BN_L25./null_BN_L25;
score_BN_und = BN_und./null_BN_und;
score_BN_plu = BN_plu./null_BN_plu;

score_SC_L1 = SC_L1./null_SC_L1;
score_SC_L2 = SC_L2./null_SC_L2;
score_SC_L3 = SC_L3./null_SC_L3;
score_SC_L4 = SC_L4./null_SC_L4;
score_SC_L5 = SC_L5./null_SC_L5;
score_SC_L6 = SC_L6./null_SC_L6;
score_SC_L7 = SC_L7./null_SC_L7;
score_SC_L8 = SC_L8./null_SC_L8;
score_SC_L9 = SC_L9./null_SC_L9;
score_SC_L10 = SC_L10./null_SC_L10;
score_SC_L11 = SC_L11./null_SC_L11;
score_SC_L12 = SC_L12./null_SC_L12;
score_SC_L13 = SC_L13./null_SC_L13;
score_SC_L14 = SC_L14./null_SC_L14;
score_SC_L15 = SC_L15./null_SC_L15;
score_SC_L16 = SC_L16./null_SC_L16;
score_SC_L17 = SC_L17./null_SC_L17;
score_SC_L18 = SC_L18./null_SC_L18;
score_SC_L19 = SC_L19./null_SC_L19;
score_SC_L20 = SC_L20./null_SC_L20;
score_SC_L21 = SC_L21./null_SC_L21;
score_SC_L22 = SC_L22./null_SC_L22;
score_SC_L23 = SC_L23./null_SC_L23;
score_SC_L24 = SC_L24./null_SC_L24;
score_SC_L25 = SC_L25./null_SC_L25;
score_SC_und = SC_und./null_SC_und;
score_SC_plu = SC_plu./null_SC_plu;

save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/score_BN_L_MDS_50.mat','score_BN_L1','score_BN_L2','score_BN_L3','score_BN_L4','score_BN_L5','score_BN_L6','score_BN_L7','score_BN_L8','score_BN_L9','score_BN_L10','score_BN_L11','score_BN_L12','score_BN_L13','score_BN_L14','score_BN_L15','score_BN_L16','score_BN_L17','score_BN_L18','score_BN_L19','score_BN_L20','score_BN_L21','score_BN_L22','score_BN_L23','score_BN_L24','score_BN_L25','score_BN_und','score_BN_plu');
save('/Users/DoerLBH/Dropbox/git/Py3_scTDA/data/zebrafish-Regev/score_SC_L_MDS_50.mat','score_SC_L1','score_SC_L2','score_SC_L3','score_SC_L4','score_SC_L5','score_SC_L6','score_SC_L7','score_SC_L8','score_SC_L9','score_SC_L10','score_SC_L11','score_SC_L12','score_SC_L13','score_SC_L14','score_SC_L15','score_SC_L16','score_SC_L17','score_SC_L18','score_SC_L19','score_SC_L20','score_SC_L21','score_SC_L22','score_SC_L23','score_SC_L24','score_SC_L25','score_SC_und','score_SC_plu');

%% plot SC for timepoints

figure(1)
lw = 2;

stages = 12;
c = [linspace(0,0.9,stages);linspace(0,0.9,stages);linspace(0,0.9,stages)]';
c = flipud(c);

% plot(0:dmax,log(nanmean(SC_T1)),'lineWidth',lw,'Color',c(1,:)); hold on
% plot(0:dmax,log(nanmean(SC_T2)),'lineWidth',lw,'Color',c(2,:)); 
% plot(0:dmax,log(nanmean(SC_T3)),'lineWidth',lw,'Color',c(3,:)); 
% plot(0:dmax,log(nanmean(SC_T4)),'lineWidth',lw,'Color',c(4,:));
% plot(0:dmax,log(nanmean(SC_T5)),'lineWidth',lw,'Color',c(5,:));
% plot(0:dmax,log(nanmean(SC_T6)),'lineWidth',lw,'Color',c(6,:));
% plot(0:dmax,log(nanmean(SC_T7)),'lineWidth',lw,'Color',c(7,:));
% plot(0:dmax,log(nanmean(SC_T8)),'lineWidth',lw,'Color',c(8,:)); 
% plot(0:dmax,log(nanmean(SC_T9)),'lineWidth',lw,'Color',c(9,:)); 
% plot(0:dmax,log(nanmean(SC_T10)),'lineWidth',lw,'Color',c(10,:));
% plot(0:dmax,log(nanmean(SC_T11)),'lineWidth',lw,'Color',c(11,:));
% plot(0:dmax,log(nanmean(SC_T12)),'lineWidth',lw,'Color',c(12,:));

plot(0:dmax,log(nanmean(score_SC_T1)),'lineWidth',lw,'Color',c(1,:)); hold on
plot(0:dmax,log(nanmean(score_SC_T2)),'lineWidth',lw,'Color',c(2,:)); 
plot(0:dmax,log(nanmean(score_SC_T3)),'lineWidth',lw,'Color',c(3,:)); 
plot(0:dmax,log(nanmean(score_SC_T4)),'lineWidth',lw,'Color',c(4,:));
plot(0:dmax,log(nanmean(score_SC_T5)),'lineWidth',lw,'Color',c(5,:));
plot(0:dmax,log(nanmean(score_SC_T6)),'lineWidth',lw,'Color',c(6,:));
plot(0:dmax,log(nanmean(score_SC_T7)),'lineWidth',lw,'Color',c(7,:));
plot(0:dmax,log(nanmean(score_SC_T8)),'lineWidth',lw,'Color',c(8,:)); 
plot(0:dmax,log(nanmean(score_SC_T9)),'lineWidth',lw,'Color',c(9,:)); 
plot(0:dmax,log(nanmean(score_SC_T10)),'lineWidth',lw,'Color',c(10,:));
plot(0:dmax,log(nanmean(score_SC_T11)),'lineWidth',lw,'Color',c(11,:));
plot(0:dmax,log(nanmean(score_SC_T12)),'lineWidth',lw,'Color',c(12,:));

% legend('T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12');
xlabel('dimension')

% ylabel('# of complexes')
ylabel('log(# of complexes)')

colormap(c)
caxis([1 12])
h = colorbar;
ylabel(h, 'timepoints')

title('number of simplices (with n = 50)')

%% plot SC in surf for timepoints

figure(2)
X = [(nanmean(SC_T1)); 
    (nanmean(SC_T2)); 
    (nanmean(SC_T3));
    (nanmean(SC_T4));
    (nanmean(SC_T5));
    (nanmean(SC_T6));
    (nanmean(SC_T7));
    (nanmean(SC_T8));
    (nanmean(SC_T9));
    (nanmean(SC_T10));
    (nanmean(SC_T11));
    (nanmean(SC_T12))];
% X = [(nanmean(score_SC_T1)); 
%     (nanmean(score_SC_T2)); 
%     (nanmean(score_SC_T3));
%     (nanmean(score_SC_T4));
%     (nanmean(score_SC_T5));
%     (nanmean(score_SC_T6));
%     (nanmean(score_SC_T7));
%     (nanmean(score_SC_T8));
%     (nanmean(score_SC_T9));
%     (nanmean(score_SC_T10));
%     (nanmean(score_SC_T11));
%     (nanmean(score_SC_T12))];
surf(X','FaceAlpha',0.5)
xlabel('timepoints')
ylabel('simplicial dimension')
zlabel('num of simplices (with n=50)')
% zlabel('normalized simplicial complexity')

% title('number of simplices (with n = 100)')

colorbar

%% plot BN for timepoints

figure(3)
lw = 2;

stages = 12;
c = [linspace(0,0.9,stages);linspace(0,0.9,stages);linspace(0,0.9,stages)]';
c = flipud(c);

errorbar(0:dmax-1,nanmean(BN_T1(:,1:dmax)),conf95(BN_T1(:,1:dmax)) ,'lineWidth',lw,'Color',c(1,:)); hold on
errorbar(0:dmax-1,nanmean(BN_T2(:,1:dmax)),conf95(BN_T2(:,1:dmax)) ,'lineWidth',lw,'Color',c(2,:));
errorbar(0:dmax-1,nanmean(BN_T3(:,1:dmax)),conf95(BN_T3(:,1:dmax)) ,'lineWidth',lw,'Color',c(3,:)); 
errorbar(0:dmax-1,nanmean(BN_T4(:,1:dmax)),conf95(BN_T4(:,1:dmax)) ,'lineWidth',lw,'Color',c(4,:));
errorbar(0:dmax-1,nanmean(BN_T5(:,1:dmax)),conf95(BN_T5(:,1:dmax)) ,'lineWidth',lw,'Color',c(5,:));
errorbar(0:dmax-1,nanmean(BN_T6(:,1:dmax)),conf95(BN_T6(:,1:dmax)) ,'lineWidth',lw,'Color',c(6,:));
errorbar(0:dmax-1,nanmean(BN_T7(:,1:dmax)),conf95(BN_T7(:,1:dmax)) ,'lineWidth',lw,'Color',c(7,:));
errorbar(0:dmax-1,nanmean(BN_T8(:,1:dmax)),conf95(BN_T8(:,1:dmax)) ,'lineWidth',lw,'Color',c(8,:)); 
errorbar(0:dmax-1,nanmean(BN_T9(:,1:dmax)),conf95(BN_T9(:,1:dmax)) ,'lineWidth',lw,'Color',c(9,:));
errorbar(0:dmax-1,nanmean(BN_T10(:,1:dmax)),conf95(BN_T10(:,1:dmax)) ,'lineWidth',lw,'Color',c(10,:));
errorbar(0:dmax-1,nanmean(BN_T11(:,1:dmax)),conf95(BN_T11(:,1:dmax)) ,'lineWidth',lw,'Color',c(11,:));
errorbar(0:dmax-1,nanmean(BN_T12(:,1:dmax)),conf95(BN_T12(:,1:dmax)) ,'lineWidth',lw,'Color',c(12,:));

% legend('T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12');
xlabel('Betti number order')
ylabel('Betti number')

colormap(c)
caxis([1 12])
h = colorbar;
ylabel(h, 'timepoints')

axis([0 6 0 10])
title('Betti numbers (with n = 50)')

%% plot BN in surf for timepoints

figure(4)
X = [(nanmean(BN_T1(:,1:dmax))); 
    (nanmean(BN_T2(:,1:dmax))); 
    (nanmean(BN_T3(:,1:dmax)));
    (nanmean(BN_T4(:,1:dmax)));
    (nanmean(BN_T5(:,1:dmax)));
    (nanmean(BN_T6(:,1:dmax)));
    (nanmean(BN_T7(:,1:dmax)));
    (nanmean(BN_T8(:,1:dmax)));
    (nanmean(BN_T9(:,1:dmax)));
    (nanmean(BN_T10(:,1:dmax)));
    (nanmean(BN_T11(:,1:dmax)));
    (nanmean(BN_T12(:,1:dmax)))];
surf(X')
xlabel('timepoints')
ylabel('Betti number order')
zlabel('Betti number')
title('Betti numbers (with n = 50)')


%% plot SC for lineages

[~,index] = sort([nanmean(log(nanmean(SC_L1))),nanmean(log(nanmean(SC_L2))),nanmean(log(nanmean(SC_L3))),nanmean(log(nanmean(SC_L4))),nanmean(log(nanmean(SC_L5))),nanmean(log(nanmean(SC_L6))),nanmean(log(nanmean(SC_L7))),nanmean(log(nanmean(SC_L8))),nanmean(log(nanmean(SC_L9))),nanmean(log(nanmean(SC_L10))),nanmean(log(nanmean(SC_L11))),nanmean(log(nanmean(SC_L12))),nanmean(log(nanmean(SC_L13))),nanmean(log(nanmean(SC_L14))),nanmean(log(nanmean(SC_L15))),nanmean(log(nanmean(SC_L16))),nanmean(log(nanmean(SC_L17))),nanmean(log(nanmean(SC_L18))),nanmean(log(nanmean(SC_L19))),nanmean(log(nanmean(SC_L20))),nanmean(log(nanmean(SC_L21))),nanmean(log(nanmean(SC_L22))),nanmean(log(nanmean(SC_L23))),nanmean(log(nanmean(SC_L24))),nanmean(log(nanmean(SC_L25))),nanmean(log(nanmean(SC_und))),nanmean(log(nanmean(SC_plu)))]);
index

% 5  17  24  12  16   7   1   9  22  27  19  10  25   4  21  20   8  11   3  13  26  18  23  15   2  14   6

%% 
figure(5)
lw = 2;

stages = 27;
% c = [linspace(0,0.9,stages);linspace(0,0.9,stages);linspace(0,0.9,stages)]';
% c = flipud(c);
% c = colormap(lines);
c = colormap(jet(stages));

plot(1:dmax,log(nanmean(SC_L1)),'lineWidth',lw,'Color',c(7,:));  hold on
plot(1:dmax,log(nanmean(SC_L2)),'lineWidth',lw,'Color',c(25,:)); 
plot(1:dmax,log(nanmean(SC_L3)),'lineWidth',lw,'Color',c(19,:)); 
plot(1:dmax,log(nanmean(SC_L4)),'lineWidth',lw,'Color',c(14,:));
plot(1:dmax,log(nanmean(SC_L5)),'lineWidth',lw,'Color',c(1,:));
plot(1:dmax,log(nanmean(SC_L6)),'lineWidth',lw,'Color',c(27,:));
plot(1:dmax,log(nanmean(SC_L7)),'lineWidth',lw,'Color',c(6,:));
plot(1:dmax,log(nanmean(SC_L8)),'lineWidth',lw,'Color',c(17,:)); 
plot(1:dmax,log(nanmean(SC_L9)),'lineWidth',lw,'Color',c(8,:)); 
plot(1:dmax,log(nanmean(SC_L10)),'lineWidth',lw,'Color',c(12,:));
plot(1:dmax,log(nanmean(SC_L11)),'lineWidth',lw,'Color',c(18,:));
plot(1:dmax,log(nanmean(SC_L12)),'lineWidth',lw,'Color',c(4,:));
plot(1:dmax,log(nanmean(SC_L13)),'lineWidth',lw,'Color',c(20,:)); 
plot(1:dmax,log(nanmean(SC_L14)),'lineWidth',lw,'Color',c(26,:));
plot(1:dmax,log(nanmean(SC_L15)),'lineWidth',lw,'Color',c(24,:));
plot(1:dmax,log(nanmean(SC_L16)),'lineWidth',lw,'Color',c(5,:));
plot(1:dmax,log(nanmean(SC_L17)),'lineWidth',lw,'Color',c(2,:));
plot(1:dmax,log(nanmean(SC_L18)),'lineWidth',lw,'Color',c(22,:)); 
plot(1:dmax,log(nanmean(SC_L19)),'lineWidth',lw,'Color',c(11,:)); 
plot(1:dmax,log(nanmean(SC_L20)),'lineWidth',lw,'Color',c(16,:));
plot(1:dmax,log(nanmean(SC_L21)),'lineWidth',lw,'Color',c(15,:));
plot(1:dmax,log(nanmean(SC_L22)),'lineWidth',lw,'Color',c(9,:));
plot(1:dmax,log(nanmean(SC_L23)),'lineWidth',lw,'Color',c(23,:)); 
plot(1:dmax,log(nanmean(SC_L24)),'lineWidth',lw,'Color',c(3,:)); 
plot(1:dmax,log(nanmean(SC_L25)),'lineWidth',lw,'Color',c(13,:));
plot(1:dmax,log(nanmean(SC_und)),'lineWidth',lw,'Color',c(21,:)); 
plot(1:dmax,log(nanmean(SC_plu)),'lineWidth',lw,'Color',c(10,:));

% legend('T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12');
xlabel('dimension')

% ylabel('# of complexes')
ylabel('log(# of complexes)')

colormap(c)
% caxis([1 12])
% labels = {'Lineage: Spinal Cord','Lineage: Diencephalon','Lineage: Optic Cup','Lineage: Midbrain Neural Crest','Lineage: Hindbrain R3','Lineage: Hindbrain R4 5 6','Lineage: Telencephalon','Lineage: Epidermis','Lineage: Neural Plate Border','Lineage: Placode Adeno. Lens Trigeminal','Lineage: Placode Epibranchial Otic','Lineage: Placode Olfactory','Lineage: Tailbud','Lineage: Adaxial Cells','Lineage: Somites','Lineage: Hematopoeitic ICM','Lineage: Hematopoeitic RBI Pronephros','Lineage: Endoderm Pharyngeal','Lineage: Endoderm Pancreatic Intestinal','Lineage: Heart Primordium','Lineage: Cephalic Mesoderm','Lineage: Prechordal Plate','Lineage: Notochord','Lineage: Primordial Germ Cells','Lineage: EVL','undefined','pluripotent'};
labels = {'Lineage 1','Lineage 2','Lineage 3','Lineage 4','Lineage 5','Lineage 6','Lineage 7','Lineage 8','Lineage 9','Lineage 10','Lineage 11','Lineage 12','Lineage 13','Lineage 14','Lineage 15','Lineage 16','Lineage 17','Lineage 18','Lineage 19','Lineage 20','Lineage 21','Lineage 22','Lineage 23','Lineage 24','Lineage 25','Undefined','Pluripotent'};
h = lcolorbar(labels(index),'TitleString','Lineages');
% h = colorbar;
% ylabel(h, 'Lineages')
% set(h, 'YDir', 'reverse' );

axis([1 7 0 12])

title('number of simplices (with n = 50)')

%% plot SC in surf for lineages

figure(6)
X = [
    
    log(nanmean(SC_L1));
    log(nanmean(SC_L2));
    log(nanmean(SC_L3));
    log(nanmean(SC_L4));
    log(nanmean(SC_L5));
    log(nanmean(SC_L6));
    log(nanmean(SC_L7));
    log(nanmean(SC_L8)); 
    log(nanmean(SC_L9));   
    log(nanmean(SC_L10));     
    log(nanmean(SC_L11)); 
    log(nanmean(SC_L12));
    log(nanmean(SC_L13));
    log(nanmean(SC_L14));
    log(nanmean(SC_L15));
    log(nanmean(SC_L16));
    log(nanmean(SC_L17));
    log(nanmean(SC_L18));
    log(nanmean(SC_L19));
    log(nanmean(SC_L20));
    log(nanmean(SC_L21));
    log(nanmean(SC_L22));
    log(nanmean(SC_L23));
    log(nanmean(SC_L24));
    log(nanmean(SC_L25));
    log(nanmean(SC_und)); 
    log(nanmean(SC_plu))];
surf(X')

xlabel('lineages')
ylabel('dimension')
zlabel('log(# of complexes)')
title('number of simplices (with n = 50)')

%%% TODO: HEATMAP!

%% plot BN for lineages

figure(7)
lw = 2;

stages = 27;
% c = [linspace(0,0.9,stages);linspace(0,0.9,stages);linspace(0,0.9,stages)]';
% c = flipud(c);
c = colormap(lines);

errorbar(0:dmax-1,nanmean(BN_L1(:,1:dmax)),conf95(BN_L1(:,1:dmax)) ,'lineWidth',lw,'Color',c(1,:));  hold on
errorbar(0:dmax-1,nanmean(BN_L2(:,1:dmax)),conf95(BN_L2(:,1:dmax)) ,'lineWidth',lw,'Color',c(2,:));
errorbar(0:dmax-1,nanmean(BN_L3(:,1:dmax)),conf95(BN_L3(:,1:dmax)) ,'lineWidth',lw,'Color',c(3,:)); 
errorbar(0:dmax-1,nanmean(BN_L4(:,1:dmax)),conf95(BN_L4(:,1:dmax)) ,'lineWidth',lw,'Color',c(4,:));
errorbar(0:dmax-1,nanmean(BN_L5(:,1:dmax)),conf95(BN_L5(:,1:dmax)) ,'lineWidth',lw,'Color',c(5,:));
errorbar(0:dmax-1,nanmean(BN_L6(:,1:dmax)),conf95(BN_L6(:,1:dmax)) ,'lineWidth',lw,'Color',c(6,:));
errorbar(0:dmax-1,nanmean(BN_L7(:,1:dmax)),conf95(BN_L7(:,1:dmax)) ,'lineWidth',lw,'Color',c(7,:));
errorbar(0:dmax-1,nanmean(BN_L8(:,1:dmax)),conf95(BN_L8(:,1:dmax)) ,'lineWidth',lw,'Color',c(8,:)); 
errorbar(0:dmax-1,nanmean(BN_L9(:,1:dmax)),conf95(BN_L9(:,1:dmax)) ,'lineWidth',lw,'Color',c(9,:));
errorbar(0:dmax-1,nanmean(BN_L10(:,1:dmax)),conf95(BN_L10(:,1:dmax)) ,'lineWidth',lw,'Color',c(10,:));
errorbar(0:dmax-1,nanmean(BN_L11(:,1:dmax)),conf95(BN_L11(:,1:dmax)) ,'lineWidth',lw,'Color',c(11,:));
errorbar(0:dmax-1,nanmean(BN_L12(:,1:dmax)),conf95(BN_L12(:,1:dmax)) ,'lineWidth',lw,'Color',c(12,:));
errorbar(0:dmax-1,nanmean(BN_L13(:,1:dmax)),conf95(BN_L13(:,1:dmax)) ,'lineWidth',lw,'Color',c(13,:)); 
errorbar(0:dmax-1,nanmean(BN_L14(:,1:dmax)),conf95(BN_L14(:,1:dmax)) ,'lineWidth',lw,'Color',c(14,:));
errorbar(0:dmax-1,nanmean(BN_L15(:,1:dmax)),conf95(BN_L15(:,1:dmax)) ,'lineWidth',lw,'Color',c(15,:));
errorbar(0:dmax-1,nanmean(BN_L16(:,1:dmax)),conf95(BN_L16(:,1:dmax)) ,'lineWidth',lw,'Color',c(16,:));
errorbar(0:dmax-1,nanmean(BN_L17(:,1:dmax)),conf95(BN_L17(:,1:dmax)) ,'lineWidth',lw,'Color',c(17,:));
errorbar(0:dmax-1,nanmean(BN_L18(:,1:dmax)),conf95(BN_L18(:,1:dmax)) ,'lineWidth',lw,'Color',c(18,:)); 
errorbar(0:dmax-1,nanmean(BN_L19(:,1:dmax)),conf95(BN_L19(:,1:dmax)) ,'lineWidth',lw,'Color',c(19,:));
errorbar(0:dmax-1,nanmean(BN_L20(:,1:dmax)),conf95(BN_L20(:,1:dmax)) ,'lineWidth',lw,'Color',c(20,:));
errorbar(0:dmax-1,nanmean(BN_L21(:,1:dmax)),conf95(BN_L21(:,1:dmax)) ,'lineWidth',lw,'Color',c(21,:));
errorbar(0:dmax-1,nanmean(BN_L22(:,1:dmax)),conf95(BN_L22(:,1:dmax)) ,'lineWidth',lw,'Color',c(22,:));
errorbar(0:dmax-1,nanmean(BN_L23(:,1:dmax)),conf95(BN_L23(:,1:dmax)) ,'lineWidth',lw,'Color',c(23,:)); 
errorbar(0:dmax-1,nanmean(BN_L24(:,1:dmax)),conf95(BN_L24(:,1:dmax)) ,'lineWidth',lw,'Color',c(24,:));
errorbar(0:dmax-1,nanmean(BN_L25(:,1:dmax)),conf95(BN_L25(:,1:dmax)) ,'lineWidth',lw,'Color',c(25,:));
errorbar(0:dmax-1,nanmean(BN_und(:,1:dmax)),conf95(BN_und(:,1:dmax)) ,'lineWidth',lw,'Color',c(26,:));
errorbar(0:dmax-1,nanmean(BN_plu(:,1:dmax)),conf95(BN_plu(:,1:dmax)) ,'lineWidth',lw,'Color',c(27,:));

% legend('T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11','T12');
xlabel('Betti number order')
ylabel('Betti number')

colormap(jet(stages))
% caxis([1 12])
% labels = {'Lineage: Spinal Cord','Lineage: Diencephalon','Lineage: Optic Cup','Lineage: Midbrain Neural Crest','Lineage: Hindbrain R3','Lineage: Hindbrain R4 5 6','Lineage: Telencephalon','Lineage: Epidermis','Lineage: Neural Plate Border','Lineage: Placode Adeno. Lens Trigeminal','Lineage: Placode Epibranchial Otic','Lineage: Placode Olfactory','Lineage: Tailbud','Lineage: Adaxial Cells','Lineage: Somites','Lineage: Hematopoeitic ICM','Lineage: Hematopoeitic RBI Pronephros','Lineage: Endoderm Pharyngeal','Lineage: Endoderm Pancreatic Intestinal','Lineage: Heart Primordium','Lineage: Cephalic Mesoderm','Lineage: Prechordal Plate','Lineage: Notochord','Lineage: Primordial Germ Cells','Lineage: EVL','undefined','pluripotent'};
labels = {'Lineage 1','Lineage 2','Lineage 3','Lineage 4','Lineage 5','Lineage 6','Lineage 7','Lineage 8','Lineage 9','Lineage 10','Lineage 11','Lineage 12','Lineage 13','Lineage 14','Lineage 15','Lineage 16','Lineage 17','Lineage 18','Lineage 19','Lineage 20','Lineage 21','Lineage 22','Lineage 23','Lineage 24','Lineage 25','Undefined','Pluripotent'};
h = lcolorbar(labels,'TitleString','Lineages');
% h = colorbar;
% ylabel(h, 'Lineages')


axis([0 6 0 12])
title('Betti numbers (with n = 50)')

%% plot BN in surf for lineages

figure(8)
X = [(nanmean(BN_L1(:,1:dmax))); 
    (nanmean(BN_L2(:,1:dmax))); 
    (nanmean(BN_L3(:,1:dmax)));
    (nanmean(BN_L4(:,1:dmax)));
    (nanmean(BN_L5(:,1:dmax)));
    (nanmean(BN_L6(:,1:dmax)));
    (nanmean(BN_L7(:,1:dmax)));
    (nanmean(BN_L8(:,1:dmax)));
    (nanmean(BN_L9(:,1:dmax)));
    (nanmean(BN_L10(:,1:dmax)));
    (nanmean(BN_L11(:,1:dmax)));
    (nanmean(BN_L12(:,1:dmax)));
    (nanmean(BN_L13(:,1:dmax)));
    (nanmean(BN_L14(:,1:dmax)));
    (nanmean(BN_L15(:,1:dmax)));
    (nanmean(BN_L16(:,1:dmax)));
    (nanmean(BN_L17(:,1:dmax)));
    (nanmean(BN_L18(:,1:dmax)));
    (nanmean(BN_L19(:,1:dmax)));
    (nanmean(BN_L20(:,1:dmax)));
    (nanmean(BN_L21(:,1:dmax)));
    (nanmean(BN_L22(:,1:dmax)));
    (nanmean(BN_L23(:,1:dmax)));
    (nanmean(BN_L24(:,1:dmax)));
    (nanmean(BN_L25(:,1:dmax)));
    (nanmean(BN_und(:,1:dmax))); 
    (nanmean(BN_plu(:,1:dmax))) ];
surf(X')
xlabel('lineages')
ylabel('Betti number order')
zlabel('Betti number')
title('Betti numbers (with n = 50)')


%% plot SC3 vs. SC1

lw = 2;
v = 0;

A = score_SC_T2(:,5);
A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );

SC0 = [nanmean(score_SC_T1(:,1)),nanmean(score_SC_T2(:,1)),nanmean(score_SC_T3(:,1)),nanmean(score_SC_T4(:,1)),nanmean(score_SC_T5(:,1)),nanmean(score_SC_T6(:,1)),nanmean(score_SC_T7(:,1)),nanmean(score_SC_T8(:,1)),nanmean(score_SC_T9(:,1)),nanmean(score_SC_T10(:,1)),nanmean(score_SC_T11(:,1)),nanmean(score_SC_T12(:,1))];
SC1 = [nanmean(score_SC_T1(:,2)),nanmean(score_SC_T2(:,2)),nanmean(score_SC_T3(:,2)),nanmean(score_SC_T4(:,2)),nanmean(score_SC_T5(:,2)),nanmean(score_SC_T6(:,2)),nanmean(score_SC_T7(:,2)),nanmean(score_SC_T8(:,2)),nanmean(score_SC_T9(:,2)),nanmean(score_SC_T10(:,2)),nanmean(score_SC_T11(:,2)),nanmean(score_SC_T12(:,2))];
SC2 = [nanmean(score_SC_T1(:,3)),nanmean(score_SC_T2(:,3)),nanmean(score_SC_T3(:,3)),nanmean(score_SC_T4(:,3)),nanmean(score_SC_T5(:,3)),nanmean(score_SC_T6(:,3)),nanmean(score_SC_T7(:,3)),nanmean(score_SC_T8(:,3)),nanmean(score_SC_T9(:,3)),nanmean(score_SC_T10(:,3)),nanmean(score_SC_T11(:,3)),nanmean(score_SC_T12(:,3))];
SC3 = [nanmean(score_SC_T1(:,4)),nanmean(score_SC_T2(:,4)),nanmean(score_SC_T3(:,4)),nanmean(score_SC_T4(:,4)),nanmean(score_SC_T5(:,4)),nanmean(score_SC_T6(:,4)),nanmean(score_SC_T7(:,4)),nanmean(score_SC_T8(:,4)),nanmean(score_SC_T9(:,4)),nanmean(score_SC_T10(:,4)),nanmean(score_SC_T11(:,4)),nanmean(score_SC_T12(:,4))];
SC4 = [nanmean(score_SC_T1(:,5)),nanmean(A),nanmean(score_SC_T3(:,5)),nanmean(score_SC_T4(:,5)),nanmean(score_SC_T5(:,5)),nanmean(score_SC_T6(:,5)),nanmean(score_SC_T7(:,5)),nanmean(score_SC_T8(:,5)),nanmean(score_SC_T9(:,5)),nanmean(score_SC_T10(:,5)),nanmean(score_SC_T11(:,5)),nanmean(score_SC_T12(:,5))];
SC5 = [nanmean(score_SC_T1(:,6)),nanmean(score_SC_T2(:,6)),nanmean(score_SC_T3(:,6)),nanmean(score_SC_T4(:,6)),nanmean(score_SC_T5(:,6)),nanmean(score_SC_T6(:,6)),nanmean(score_SC_T7(:,6)),nanmean(score_SC_T8(:,6)),nanmean(score_SC_T9(:,6)),nanmean(score_SC_T10(:,6)),nanmean(score_SC_T11(:,6)),nanmean(score_SC_T12(:,6))];
SC6 = [nanmean(score_SC_T1(:,7)),nanmean(score_SC_T2(:,7)),nanmean(score_SC_T3(:,7)),nanmean(score_SC_T4(:,7)),nanmean(score_SC_T5(:,7)),nanmean(score_SC_T6(:,7)),nanmean(score_SC_T7(:,7)),nanmean(score_SC_T8(:,7)),nanmean(score_SC_T9(:,7)),nanmean(score_SC_T10(:,7)),nanmean(score_SC_T11(:,7)),nanmean(score_SC_T12(:,7))];

% plot(SC1(1),SC3(1), 'o'); hold on
% plot(SC1(2),SC3(2), 'o');
% plot(SC1(3),SC3(3), 'o');
% plot(SC1(4),SC3(4), 'o');
% plot(SC1(5),SC3(5), 'o');

E1  = [SC1(1),  SC4(1)];
E2  = [SC1(2),  SC4(2)];
E3  = [SC1(3),  SC4(3)];
E4  = [SC1(4),  SC4(4)];
E5  = [SC1(5),  SC4(5)];
E6  = [SC1(6),  SC4(6)];
E7  = [SC1(7),  SC4(7)];
E8  = [SC1(8),  SC4(8)];
E9  = [SC1(9),  SC4(9)];
E10 = [SC1(10), SC4(10)];
E11 = [SC1(11), SC4(11)];
E12 = [SC1(12), SC4(12)];

dp1 = E2 - E1;    
dp2 = E3 - E2;    
dp3 = E4 - E3;    
dp4 = E5 - E4;    
dp5 = E6 - E5;    
dp6 = E7 - E6;    
dp7 = E8 - E7;   
dp8 = E9 - E8;    
dp9 = E10 - E9;    
dp10 = E11 - E10;  
dp11 = E12 - E11;     

figure
quiver(E1(1),E1(2),dp1(1),dp1(2),v,'linewidth',lw); hold on
quiver(E2(1),E2(2),dp2(1),dp2(2),v,'linewidth',lw); 
quiver(E3(1),E3(2),dp3(1),dp3(2),v,'linewidth',lw); 
quiver(E4(1),E4(2),dp4(1),dp4(2),v,'linewidth',lw); 
quiver(E5(1),E5(2),dp5(1),dp5(2),v,'linewidth',lw); 
quiver(E6(1),E6(2),dp6(1),dp6(2),v,'linewidth',lw);
quiver(E7(1),E7(2),dp7(1),dp7(2),v,'linewidth',lw);
quiver(E8(1),E8(2),dp8(1),dp8(2),v,'linewidth',lw);
quiver(E9(1),E9(2),dp9(1),dp9(2),v,'linewidth',lw);
quiver(E10(1),E10(2),dp10(1),dp10(2),v,'linewidth',lw);
quiver(E11(1),E11(2),dp11(1),dp11(2),v,'linewidth',lw);
grid

% axis([0  10  0  10])
text(E1(1),E1(2), sprintf('E1 (%.0f,%.0f)',E1))
text(E2(1),E2(2), sprintf('E2 (%.0f,%.0f)',E2))
text(E3(1),E3(2), sprintf('E3 (%.0f,%.0f)',E3))
text(E4(1),E4(2), sprintf('E4 (%.0f,%.0f)',E4))
text(E5(1),E5(2), sprintf('E5 (%.0f,%.0f)',E5))
text(E6(1),E6(2), sprintf('E6 (%.0f,%.0f)',E6))
text(E7(1),E7(2), sprintf('E7 (%.0f,%.0f)',E7))
text(E8(1),E8(2), sprintf('E8 (%.0f,%.0f)',E8))
text(E9(1),E9(2), sprintf('E9 (%.0f,%.0f)',E9))
text(E10(1),E10(2), sprintf('E10 (%.0f,%.0f)',E10))
text(E11(1),E11(2), sprintf('E11 (%.0f,%.0f)',E11))
text(E12(1),E12(2), sprintf('E12 (%.0f,%.0f)',E12))

xlabel('1-simplices')
ylabel('4-simplices')
title('4-simplices vs. 1-simplices (with n = 100)')


%%

c = colormap(lines(12));

lw = 2;
v = 0;

A = score_SC_T2(:,5);
A = A( ~any( isnan( A ) | isinf( A ), 2 ),: );

SC0 = [nanmean(score_SC_T1(:,1)),nanmean(score_SC_T2(:,1)),nanmean(score_SC_T3(:,1)),nanmean(score_SC_T4(:,1)),nanmean(score_SC_T5(:,1)),nanmean(score_SC_T6(:,1)),nanmean(score_SC_T7(:,1)),nanmean(score_SC_T8(:,1)),nanmean(score_SC_T9(:,1)),nanmean(score_SC_T10(:,1)),nanmean(score_SC_T11(:,1)),nanmean(score_SC_T12(:,1))];
SC1 = [nanmean(score_SC_T1(:,2)),nanmean(score_SC_T2(:,2)),nanmean(score_SC_T3(:,2)),nanmean(score_SC_T4(:,2)),nanmean(score_SC_T5(:,2)),nanmean(score_SC_T6(:,2)),nanmean(score_SC_T7(:,2)),nanmean(score_SC_T8(:,2)),nanmean(score_SC_T9(:,2)),nanmean(score_SC_T10(:,2)),nanmean(score_SC_T11(:,2)),nanmean(score_SC_T12(:,2))];
SC2 = [nanmean(score_SC_T1(:,3)),nanmean(score_SC_T2(:,3)),nanmean(score_SC_T3(:,3)),nanmean(score_SC_T4(:,3)),nanmean(score_SC_T5(:,3)),nanmean(score_SC_T6(:,3)),nanmean(score_SC_T7(:,3)),nanmean(score_SC_T8(:,3)),nanmean(score_SC_T9(:,3)),nanmean(score_SC_T10(:,3)),nanmean(score_SC_T11(:,3)),nanmean(score_SC_T12(:,3))];
SC3 = [nanmean(score_SC_T1(:,4)),nanmean(score_SC_T2(:,4)),nanmean(score_SC_T3(:,4)),nanmean(score_SC_T4(:,4)),nanmean(score_SC_T5(:,4)),nanmean(score_SC_T6(:,4)),nanmean(score_SC_T7(:,4)),nanmean(score_SC_T8(:,4)),nanmean(score_SC_T9(:,4)),nanmean(score_SC_T10(:,4)),nanmean(score_SC_T11(:,4)),nanmean(score_SC_T12(:,4))];
SC4 = [nanmean(score_SC_T1(:,5)),nanmean(A),nanmean(score_SC_T3(:,5)),nanmean(score_SC_T4(:,5)),nanmean(score_SC_T5(:,5)),nanmean(score_SC_T6(:,5)),nanmean(score_SC_T7(:,5)),nanmean(score_SC_T8(:,5)),nanmean(score_SC_T9(:,5)),nanmean(score_SC_T10(:,5)),nanmean(score_SC_T11(:,5)),nanmean(score_SC_T12(:,5))];
SC5 = [nanmean(score_SC_T1(:,6)),nanmean(score_SC_T2(:,6)),nanmean(score_SC_T3(:,6)),nanmean(score_SC_T4(:,6)),nanmean(score_SC_T5(:,6)),nanmean(score_SC_T6(:,6)),nanmean(score_SC_T7(:,6)),nanmean(score_SC_T8(:,6)),nanmean(score_SC_T9(:,6)),nanmean(score_SC_T10(:,6)),nanmean(score_SC_T11(:,6)),nanmean(score_SC_T12(:,6))];
SC6 = [nanmean(score_SC_T1(:,7)),nanmean(score_SC_T2(:,7)),nanmean(score_SC_T3(:,7)),nanmean(score_SC_T4(:,7)),nanmean(score_SC_T5(:,7)),nanmean(score_SC_T6(:,7)),nanmean(score_SC_T7(:,7)),nanmean(score_SC_T8(:,7)),nanmean(score_SC_T9(:,7)),nanmean(score_SC_T10(:,7)),nanmean(score_SC_T11(:,7)),nanmean(score_SC_T12(:,7))];

E1  = [SC1(1),  SC4(1)];
E2  = [SC1(2),  SC4(2)];
E3  = [SC1(3),  SC4(3)];
E4  = [SC1(4),  SC4(4)];
E5  = [SC1(5),  SC4(5)];
E6  = [SC1(6),  SC4(6)];
E7  = [SC1(7),  SC4(7)];
E8  = [SC1(8),  SC4(8)];
E9  = [SC1(9),  SC4(9)];
E10 = [SC1(10), SC4(10)];
E11 = [SC1(11), SC4(11)];
E12 = [SC1(12), SC4(12)];

dp1 = E2 - E1;    
dp2 = E3 - E2;    
dp3 = E4 - E3;    
dp4 = E5 - E4;    
dp5 = E6 - E5;    
dp6 = E7 - E6;    
dp7 = E8 - E7;   
dp8 = E9 - E8;    
dp9 = E10 - E9;    
dp10 = E11 - E10;  
dp11 = E12 - E11;     

figure
quiver(E1(1),E1(2),dp1(1),dp1(2),v,'linewidth',lw); hold on
quiver(E2(1),E2(2),dp2(1),dp2(2),v,'linewidth',lw); 
quiver(E3(1),E3(2),dp3(1),dp3(2),v,'linewidth',lw); 
quiver(E4(1),E4(2),dp4(1),dp4(2),v,'linewidth',lw); 
quiver(E5(1),E5(2),dp5(1),dp5(2),v,'linewidth',lw); 
quiver(E6(1),E6(2),dp6(1),dp6(2),v,'linewidth',lw);
quiver(E7(1),E7(2),dp7(1),dp7(2),v,'linewidth',lw);
quiver(E8(1),E8(2),dp8(1),dp8(2),v,'linewidth',lw);
quiver(E9(1),E9(2),dp9(1),dp9(2),v,'linewidth',lw);
quiver(E10(1),E10(2),dp10(1),dp10(2),v,'linewidth',lw);
quiver(E11(1),E11(2),dp11(1),dp11(2),v,'linewidth',lw);
grid

% axis([0  10  0  10])
text(E1(1),E1(2), sprintf('E1 (%.0f,%.0f)',E1),'Color',c(1,:))
text(E2(1),E2(2), sprintf('E2 (%.0f,%.0f)',E2),'Color',c(2,:))
text(E3(1),E3(2), sprintf('E3 (%.0f,%.0f)',E3),'Color',c(3,:))
text(E4(1),E4(2), sprintf('E4 (%.0f,%.0f)',E4),'Color',c(4,:))
text(E5(1),E5(2), sprintf('E5 (%.0f,%.0f)',E5),'Color',c(5,:))
text(E6(1),E6(2), sprintf('E6 (%.0f,%.0f)',E6),'Color',c(6,:))
text(E7(1),E7(2), sprintf('E7 (%.0f,%.0f)',E7),'Color',c(7,:))
text(E8(1),E8(2), sprintf('E8 (%.0f,%.0f)',E8),'Color',c(8,:))
text(E9(1),E9(2), sprintf('E9 (%.0f,%.0f)',E9),'Color',c(9,:))
text(E10(1),E10(2), sprintf('E10 (%.0f,%.0f)',E10),'Color',c(10,:))
text(E11(1),E11(2), sprintf('E11 (%.0f,%.0f)',E11),'Color',c(11,:))
text(E12(1),E12(2), sprintf('E12 (%.0f,%.0f)',E12),'Color',c(12,:))

af = 0.25;
scatter(score_SC_T1(:,2),score_SC_T1(:,5), 'filled','o','MarkerFaceColor',c(1,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T2(:,2),score_SC_T2(:,5), 'filled','o','MarkerFaceColor',c(2,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T3(:,2),score_SC_T3(:,5), 'filled','o','MarkerFaceColor',c(3,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T4(:,2),score_SC_T4(:,5), 'filled','o','MarkerFaceColor',c(4,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T5(:,2),score_SC_T5(:,5), 'filled','o','MarkerFaceColor',c(5,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T6(:,2),score_SC_T6(:,5), 'filled','o','MarkerFaceColor',c(6,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T7(:,2),score_SC_T7(:,5), 'filled','o','MarkerFaceColor',c(7,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T8(:,2),score_SC_T8(:,5), 'filled','o','MarkerFaceColor',c(8,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T9(:,2),score_SC_T9(:,5), 'filled','o','MarkerFaceColor',c(9,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T10(:,2),score_SC_T10(:,5), 'filled','o','MarkerFaceColor',c(10,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T11(:,2),score_SC_T11(:,5), 'filled','o','MarkerFaceColor',c(11,:),'MarkerFaceAlpha',af); hold on
scatter(score_SC_T12(:,2),score_SC_T12(:,5), 'filled','o','MarkerFaceColor',c(12,:),'MarkerFaceAlpha',af); hold on

ylim([0.5,2.25])
xlim([0.67,1.05])
xlabel('normalized 1-simplex complexity')
ylabel('normalized 4-simplex complexity')
title('Normalized Simplicial Complexity: 4-simplices vs. 1-simplices (with n = 100)')
