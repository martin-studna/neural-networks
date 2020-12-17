function pn = perc_learn(p,x,c,lam,maxit)
    pn = p;
    for i=1:maxit
        pn = perc_update(pn,x,c,lam);
        if perc_err(pn, x, c) == 0
            break
        end
    end
end