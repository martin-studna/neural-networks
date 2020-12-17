function r = computingBits(x1, x2, epochs)

    % 2. Manual design of a neural network for computing a function
    % Function training neural network for which can compute 
    % f(x1, x2) = 3 - x1 - x2
    % 
    % r = computingBits(x1, x2, epochs)
    %
    % inputs:
    % x1 is first bit
    % x2 is second bit
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
    d = [0; 0];
    if (x1 == 1 && x2 == 1)
        d = [0;0];
    elseif (x1 == 1 && x2 == 0)
        d = [0; 1];
    elseif (x1 == 0 && x2 == 1)
        d = [1;0];
    elseif (x1 == 0 && x2 == 0)
        d = [1;1];
    end
    
    % Input
    p = [x1;x2];
    slope = 1.0;
    % Learning rate
    alpha = 1.0;
    
    for i = 1:epochs
        y_h = logsig(w_i_hb * [p; slope]);
        % Output of the output layer
        y_o = logsig(w_h_ob * [y_h;slope]); 
        % Error rate of the output layer
        delta_o = (d - y_o) * slope .* y_o .* (1 - y_o);
        % Weights from the hidden layer to the output layer with bias.
        w_h_ob = w_h_ob + alpha * delta_o .* [y_h; slope]';
        % Error rate of the hidden layer
        delta_h = delta_o .* w_h_ob .* (slope * [y_h; slope] .* (1 - [y_h; slope]))';
        % Weights from the input layer to the hidden layer with bias.
        w_i_hb = w_i_hb + alpha * delta_h*[p;slope];
        % Result
        p = logsig(w_h_ob * [logsig(w_i_hb * [p;slope]);slope]);
    end
    
    % Determine, if a bit is 1 or 0
    if p(1) >= 0.5
        p(1) = 1;
    else
        p(1) = 0;
    end
    
    if p(2) >= 0.5
        p(2) = 1;
    else
        p(2) = 0;
    end
    
    r = p(1)*2 + p(2);
end