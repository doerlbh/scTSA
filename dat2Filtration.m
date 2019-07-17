% dat2Plex
% extract PH, simplicial complexes and Betti numbers

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Affliation:   Kriegeskorte Lab, Columbia University

% Date:         07/2019

function [BN, SC] = dat2Filtration(data,dmax,ss,st,emb,filename,max_d,isNull)

import edu.stanford.math.plex4.*;

switch emb
    case 'pca'
        [coeff,pdata,latent,tsquared,explained] = pca(data);
    case 'mds'
        D = pdist(data);
        if isNull
            D = D(randperm(length(D)));
        end
        pdata = mdscale(D,max_d);
    case 'tsne'
        pdata = tsne(data, timepoints);
end
save(strcat('./output/embedding_',filename,'_',emb,'_s_',num2str(ss),'.mat'),'pdata');
hist(pdist(data))

disp(['data count: ' num2str(size(pdata,1))])
disp(['data dimension: ' num2str(size(pdata,2))])

BN = zeros(st,dmax+1);
SC = zeros(st,dmax+1);

for t = 1:st
    
    disp(['run ' num2str(t)]);
     
    % create a landmark selector
%     L = api.Plex4.createRandomSelector(pdata, ss);
    L = api.Plex4.createMaxMinSelector(pdata, ss);
    R = L.getMaxDistanceFromPointsToLandmarks();
    tmax = R / 8; % max_filtration_value
    
    % create a witness stream
    num_divisions = 100;
    nu = 2;
%     stream = api.Plex4.createWitnessStream(L, dmax, tmax, num_divisions);
    stream = streams.impl.LazyWitnessStream(L.getUnderlyingMetricSpace(), L, dmax, tmax, nu, num_divisions);
    stream.finalizeStream()
    
    % print out the size of the stream
    num_simplices = stream.getSize();
    disp(['num simplices: ' num2str(num_simplices)]);
    
    % get persistence algorithm over Z/2Z
    persistence = api.Plex4.getModularSimplicialAlgorithm(dmax, 2);
    %
    % compute the intervals
    intervals = persistence.computeIntervals(stream);
    
    % create the barcode plots
    options.filename = strcat('barcode-',filename,'-',emb,'-s-',num2str(ss),'-r-',num2str(t));
    options.max_filtration_value = tmax;
    options.max_dimension = dmax - 1;
%     options.side_by_side = true;
    plot_barcodes(intervals, options);
    movefile(strcat('barcode-',filename,'-',emb,'-s-',num2str(ss),'-r-',num2str(t),'.png'),strcat('./output/barcode_',filename,'_',emb,'_s_',num2str(ss),'_r_',num2str(t),'.png'))
    
    % compute betti numbers
    infinite_barcodes = intervals.getInfiniteIntervals();
    bn = infinite_barcodes.getBettiSequence();
    BN(t,1:length(bn)) = bn;
    
    % compute number of simplices
    iterator = stream.iterator();
    
    filtration = [];
    fdimension = [];
    while (iterator.hasNext())
        simplex = iterator.next();
        filtration_value = stream.getFiltrationValue(simplex);
        filtration = [filtration, filtration_value];
        string = char(simplex);
        vector = str2num(string(2:length(string)-1));
        d = size(vector,2);
        fdimension = [fdimension,d];
        SC(t, d) = SC(t, d) + 1;
    end
    frange = unique(filtration);
    drange = unique(fdimension);
    [X,Y] = meshgrid(frange,drange(1:length(drange))-1);
    Z = zeros(size(X));
    Z_cum = zeros(size(X));
    for d = 1:length(drange)
        fs = filtration(fdimension == d);
        for ft = 1:length(frange)
            Z(d,ft) = sum(fs == frange(ft));
            Z_cum(d,ft:size(Z_cum,2)) = Z_cum(d,ft:size(Z_cum,2)) + sum(fs == frange(ft));
        end
    end
    fig = surf(X,Y,Z_cum,'FaceAlpha',0.5);
    colorbar;
    
    fig = figure;
    Legend=cell(length(drange),1);
    for d = 1:length(drange)
        Legend{d} = [num2str(d-1),'-simplex'];
        plot(frange,Z_cum(d,:),'LineWidth',2); hold on
    end
    xlabel('filtration')
    ylabel('cumulative num of simplices')
    legend(Legend);
    saveas(fig,strcat('./output/simplex_',filename,'_',emb,'_s_',num2str(ss),'_r_',num2str(t),'.png'))
    
    clear stream persistence intervals
    
end

save(strcat('./output/compute_',filename,'_',emb,'_s_',num2str(ss),'.mat'),'BN','SC');

end
