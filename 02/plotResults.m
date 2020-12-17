function plotResults(n)
    x = log(1:n);
    deltas = ones(1,n);
    deviations = ones(1,n);
    for i = 1:n
        result = testCV();
        deltas(1,i) = result(1);
        deviations(1,i) = result(2);
    end
    
    plot(x,deltas);
    xlabel('log(number of repetions)');
    ylabel('deltas');
    title('Deltas of the Error between Memorizer and Perceptron');
end