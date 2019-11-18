% dat2Plex
% extract simplicial complexes and Betti numbers

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         05/2018

function [BN, SC] = dat2Plex(dat, delta, dmax, ss, st)

startJPlex

pdata = EuclideanArrayData(dat);
disp(['data count: ' num2str(pdata.count)])
disp(['data dimension: ' num2str(pdata.dimension)])

BN = zeros(st,dmax+1);
SC = zeros(st,dmax);

for t = 1:st
    
    disp(['sample ' num2str(t)]);
    L = WitnessStream.makeRandomLandmarks(pdata, ss);
    R = WitnessStream.estimateRmax(pdata, L);
    
    tmax = R/11;
    
    wit = Plex.WitnessStream(delta, dmax, tmax, L, pdata);
    
    %     intervals = Plex.Persistence.computeIntervals(wit);
    %     Plex.plot(intervals, 'wit', tmax)
    
    wit_Expl = Plex.makeExplicit(wit);
    intervals = Plex.Persistence.computeIntervals(wit_Expl);
    
    bn = betti2vect(Plex.FilterInfinite(intervals));
    BN(t,1:length(bn)) = bn;
    
    for d = 1:dmax
        try
            SC(t, d) = size(wit_Expl.dump(d).C, 1);
        catch
        end
    end
    
    clear wit wit_Expl intervals
    
end
