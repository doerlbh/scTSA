% dat2mat
% extract persistent homology barcodes from data matrix

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

function [ph,best_eps,dist,epsilon,barcode] = mat2phb(dat, h, ss, st, metric)

N = size(dat, 2);
dist = zeros(N,N);

switch metric
    case 'Euclidean'
        for x = 1:N
            for y = 1:N
                dist(x,y) = sqrt(sum((dat(:,x) - dat(:,y)).^2));
                dist(y,x) = dist(x,y);
            end
        end
    otherwise
        disp('TBA')
end

barcode = [];
max_dist = max(max(dist));
epsilon = linspace(0,max_dist);

switch h
    case 0
        barcode = zeros(ss,100);
        
        for s = 1:st
            for t = 1:99
                select = randsample(N,ss);
                graph = [dist(select,select) <= epsilon(t)];
                betti_0 = int64(ss - (sum(sum(graph)) - ss) / 2);
                if betti_0 <= 0
                    betti_0 = 1;
                end
%                 disp(num2str(betti_0))
                barcode(betti_0, t) = barcode(betti_0, t) + 1;
            end
        end
        
        [~, ph] = max(sum(barcode(2:end,:),2));
        ph = ph + 1;
        
        pph = barcode(ph,:) / sum(barcode(ph,:));    
        best_eps = sum(pph .* epsilon);
        best_idx = int64(sum(pph .* [1:100]));
        disp(num2str(best_idx))
        
        imagesc(barcode); hold on
        colormap(flipud(gray))
        caxis('auto')
        colorbar
        ylabel('\beta_0')
        xlabel('\epsilon')
        title('Persistent homology of \beta_0')
        line([best_idx best_idx],[0 ss],'Color',[1 0 0]);
        
    otherwise
        disp('TBA')
end