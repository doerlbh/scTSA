% dat2Plex
% extract simplicial complexes and Betti numbers

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Affliation:   Kriegeskorte Lab, Columbia University

% Date:         07/2019

function [BN, SC] = dat2JavaPlex(dat, dmax, ss, st)

import edu.stanford.math.plex4.*;

% D = pdist(dat);
% pdata = metric.impl.ExplicitMetricSpace(D);
pdata = dat;
disp(['data count: ' num2str(size(dat,1))])
disp(['data dimension: ' num2str(size(dat,2))])

BN = zeros(st,dmax+1);
SC = zeros(st,dmax+1);

for t = 1:st
    
    disp(['sample ' num2str(t)]);
     
    % create a landmark selector
    
    disp(size(pdata))
    disp(num2str(ss))
    L = api.Plex4.createRandomSelector(pdata, ss);
%     L = api.Plex4.createMaxMinSelector(pdata, ss);
    R = L.getMaxDistanceFromPointsToLandmarks();
    tmax = R / 8; % max_filtration_value
    
    % create a witness stream
    num_divisions = 20;
    nu = 2;
    stream = api.Plex4.createWitnessStream(L, dmax, tmax, num_divisions);
    % stream = streams.impl.LazyWitnessStream(L.getUnderlyingMetricSpace(), L, dmax, tmax, nu, num_divisions);
    % stream.finalizeStream()
    
    % print out the size of the stream
    num_simplices = stream.getSize();
    disp(['num simplices: ' num2str(num_simplices)]);
    
    % get persistence algorithm over Z/2Z
    persistence = api.Plex4.getModularSimplicialAlgorithm(dmax, 2);
    %
    % compute the intervals
    intervals = persistence.computeIntervals(stream);
    
    %     % create the barcode plots
    %     options.filename = 'witnessData';
    %     options.max_filtration_value = tmax;
    %     options.max_dimension = dmax - 1;
    %     plot_barcodes(intervals, options);
    
    % compute betti numbers
    infinite_barcodes = intervals.getInfiniteIntervals();
    bn = infinite_barcodes.getBettiSequence();
    BN(t,1:length(bn)) = bn;
    
    % compute number of simplices
    iterator = stream.iterator();
    while (iterator.hasNext())
        simplex = iterator.next();
        %   filtration_value = stream.getFiltrationValue(simplex);
        string = char(simplex);
        vector = str2num(string(2:length(string)-1));
        d = size(vector,2);
        SC(t, d) = SC(t, d) + 1;
    end
    
    clear stream persistence intervals
    
end

end
