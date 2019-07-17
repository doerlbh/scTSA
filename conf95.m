% to caculate 95 % confidence level error bar

function e95 = conf95(x)

e95 = (std(x)./sqrt(size(x,1))).*1.96;

end