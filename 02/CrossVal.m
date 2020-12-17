function [delta, s] = CrossVal(Name1,Name1L,Par1,Name2,Name2L,Par2, Pat, DOut, k, NoShuffle)
    % Function calculating K-Fold cross-validation between two learning
    % algorithms.
    %
    % [delta, s] = CrossVal(Name1,Name1L,Par1,Name2,Name2L,Par2, Pat, DOut, k, NoShuffle)
    %
    % inputs:
    % Name1 is the name of the first learning function,
    % Name1L is the name of the first function executing the first learning
    % function,
    % Par1 is a cell array containing parameters of the first learning
    % algorithm,
    % Name2 is the name of the first learning function,
    % Name2L is the name of the first function executing the first learning
    % function,
    % Par2 is a cell array containing parameters of the second learning
    % algorithm,
    % Pat input patterns,
    % DOut desired outputs of Pat.
    % k number of the partitions of the dataset.
    % NoShuffle can be omitted. If it is present, then the number of
    % samples must not be changed before partitioning into folds.
    %
    % output:
    % delta difference of errors
    % s standard deviation of deltas

    % Shuffle elements, if NoShuffle parameter is not present.
    if ~exist('NoShuffle','var')
        idx = randperm(size(Pat,2));
        Pat = Pat(:,idx);
        DOut = DOut(:,idx);
    end

    % Determine size of the partitions.
    groupSize = floor(size(Pat, 2) / k);
    % Alocate array for errors.
    errors = zeros(1,k);
    for i = 1:k
        % Create a test set.
        Ts = Pat(:,(i-1) * groupSize + 1:i*groupSize);
        % Create a training set. First copy whole dataset to training set and remove data
        % which are in test set.
        Tr = Pat;
        Tr(:,(i-1) * groupSize + 1:i*groupSize) = [];
        % Create desired outputs for test set and training set.
        DTr = DOut;
        DTr(:,(i-1) * groupSize + 1:i * groupSize) = [];
        DTs = DOut((i-1) * groupSize + 1:i * groupSize);
        % Calculate difference between errors of the learned functions.
        error = abs(Err(Name1, Name1L, Par1, Tr, DTr, Ts, DTs) - Err(Name2, Name2L, Par2, Tr, DTr, Ts, DTs));
        % Store error.
        errors(i) = error;
    end

    % Calculate mean of deltas
    delta = sum(errors)/length(errors);
    % Calculate standard deviation.
    s = sqrt(sum(pow2(errors - delta))/(k * (k - 1)));
end