function c = perc_err(p,x,c)
    c = sum(perc_recall(p,x) ~= c) / size(c, 1);
end