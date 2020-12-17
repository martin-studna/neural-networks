function r = evaluateNeuralNetwork(epochs)
    % 3. Example
    % Function training neural network.
    % 
    % r = evaluateNeuralNetwork(epochs)
    %
    % inputs:
    % epochs is number of iterations during the training.
    %
    % output:
    % r is the result of the neural network


    % Extended weight matrix of weights between the input and the hidden
    % layer.
    w_i_hb = [1.4 0.4 0.0; -2.0 0.8 -0.6 ];
    % Weight matrix between the hidden and the output layer
    w_h_ob = [2.1 -1.0 0.4; 1.0 1.1 -0.3 ];
    % Desired output
    d = [ 0.3; 0.3];
    % Input
    p = [-1;1];
    slope = 2.0;
    % Learning rate
    alpha = 1.5;
    % Output of the hidden layer
    
    for i = 1:epochs
        y_h = logsig(w_i_hb * [p; slope]);
        % Output of the output layer.
        y_o = logsig(w_h_ob * [y_h;slope]); 
        % Error rate of the output layer.
        delta_o = (d - y_o) * slope .* y_o .* (1 - y_o);
        % Weights from the hidden layer to the output layer with bias.
        w_h_ob = w_h_ob + alpha * delta_o .* [y_h; slope]';
        % Error rate of the hidden layer.
        delta_h = delta_o .* w_h_ob .* (slope * [y_h; slope] .* (1 - [y_h; slope]))';
        % Weights from the input layer to the hidden layer with bias.
        w_i_hb = w_i_hb + alpha * delta_h*[p;slope];
        % Result
        p = logsig(w_h_ob*[logsig(w_i_hb * [p;slope]);slope]);
    end
    
    r = p;
end