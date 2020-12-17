function p = perc_update(p, x, c, lam)
    for i=1:size(x, 2)
        p = p + lam * (c(i) - perc_recall(p, x(:,i))) * [x(:, i);1]';
    end
end