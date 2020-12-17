function G = Grade(Scores, Boundaries)
    if (nargin == 1)
        Boundaries = [86,71,56];
    end
    % (Boundaries > x) returns true, if the condition is fulfilled. In
    % matlab true is represented also as 1. We will use feature of this
    % language to get our mark.
    G = arrayfun(@(x) sum(Boundaries > x) + 1, Scores);
end


