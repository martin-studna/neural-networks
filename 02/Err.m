function E = Err(Name, NameL, Par, Tr, DTr, Ts, DTs)
    % Function, which will return error rate of the learned function.
    %
    % E = Err(Name, NameL, Par, Tr, DTr, Ts, DTs)
    %
    % inputs:
    % Name is the name of the learning function
    % NameL is the name of the function, which will computes the learned
    % function.
    % Par is a cell array containing parameters of the learning algorithm.
    % Tr matrix with training samples in columns
    % DTr row vector of the desired outputs of the training set.
    % Ts is the test set.
    % DTs row vector of the desired outputs of the test set.
    %
    % output:
    % E is the number representing the error rate of the learned function.


    % Get learned parameters from an algorithm.
    LPar = feval(Name, Tr, DTr, Par);
    % Use learned parameters to execute learned function.
    Out = feval(NameL, LPar, Ts);
    % Calculate mean of the differences of the results of the learned function
    % and desired outputs of the test set.
    E = sum(abs(Out - DTs))/size(DTs,2);
end