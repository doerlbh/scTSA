% dat2mat
% extract n-dimensional simplicial complexes from data matrix

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

function nsc = mat2nsc(dist, best_eps, ss, st, d)

d = 6;

N = size(dist, 2);
nsc = zeros(st,d);
for s = 1:st
    select = randsample(N,ss);
    graph = [dist(select,select) <= best_eps];
    
    %     for d = 1
    M1 = graph;
    betti_0 = int64(ss - (sum(sum(M1)) - ss) / 2);
    nsc(s,1) = betti_0;
    
    %     for d = 2
    M2 = zeros(ss,ss,ss);
    
    
        
end

end