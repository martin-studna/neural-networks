function S = Score(StudentResults, MaxPoints, PointsWeight)
    % default parameters
    if (nargin == 1)
        MaxPoints = 85;
        PointsWeight = 35;
    end
    % calculate scores
    S = arrayfun(@(c) getScores(c, MaxPoints, PointsWeight), StudentResults);
end

function a = getScores(c, MaxPoints, PointsWeight)
    % if sum of points is greater than MaxPoints, we use PointsWeight
    % instead of the sum.
    if sum(c{1}{1}) > MaxPoints
        a = PointsWeight + sum(c{1}{2}) + c{1}{3};
    else
        a = (sum(c{1}{1})*PointsWeight)/MaxPoints + sum(c{1}{2}) + c{1}{3};
    end
end