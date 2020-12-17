function p = neuronPotential(n)
    % 1. Weights initialization for a single neuron
    % Function calculating potential of single output neuron.
    % 
    % p = neuronPotential(n)
    %
    % inputs:
    % n is number of inputs
    %
    % output:
    % p represents potential of the neuron.


    % E = 0, Neuron has zero expected value.
    % A = 1, and its standard deviation is equal to 1.
    % Weights of the neuron are initialized with values from the uniform
    % distribution on an interval < 3/sqrt(n), 6/sqrt(n) >
    weights = rand(1,n) * (6/sqrt(n)) - (3/sqrt(n));
    p = logsig( weights * (normpdf((1:n)', 1)));
end