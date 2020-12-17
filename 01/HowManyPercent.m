function P = HowManyPercent(TargetGrade, StudentResults,Boundaries,MaxPoints,PointsWeight, MaxExamScore)
    % default parameters
    if nargin == 2
        Boundaries = [86,71,56];
        MaxPoints = 85;
        PointsWeight = 35;
        MaxExamScore = 45;
    end
    
    % First we need to sum points from assignments, quizes and lecture
    % tests
    scores = arrayfun(@(c) getScore(c, MaxPoints, PointsWeight), StudentResults);
    % Lastly, we are going to compute difference between student's score
    % and target boundary
    P = arrayfun(@(x,y) getDifference(Boundaries, MaxExamScore, x, y), scores, TargetGrade);
    
end

% sum score
function S = getScore(c, MaxPoints, PointsWeight)
    if sum(c{1}{1}) > MaxPoints
        S = PointsWeight + sum(c{1}{2});
    else
        S = (sum(c{1}{1})*PointsWeight)/MaxPoints + sum(c{1}{2});
    end
end

% calculate difference
function D = getDifference(Boundaries, MaxExamScore, x, y)
    % y represents target mark of the student.
    % If y is index which greater than length of the Boundaries array,
    % it means that our student wants worst possible mark and that also
    % means that the student needs zero points to acquire this mark.
    worstMark = false;
    if y > length(Boundaries)
        worstMark = true;
        y = length(Boundaries);
    end
    
    diff = Boundaries(y) - x;
    % if difference is negative, student needs zero percent points to
    % acquire target mark
    if diff < 0
        D = 0;
    elseif diff > MaxExamScore
        D = NaN;
    else 
        if worstMark == true
            D = 0;
        else
            D = diff;
        end
    end
end
