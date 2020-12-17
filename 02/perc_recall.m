function c = perc_recall(p,x)
    c = p * [x;ones(1, size(x,2))] >= 0;
end