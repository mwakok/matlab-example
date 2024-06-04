function result = binomialRandom(n, p)
    % Random numbers from binomial distribution
    %
    % Args:
    %   n (int): Number of trials
    %   p (double): Probability of success
    %
    % Returns:
    %   double: random numbers
    result = binornd(n, p)
    end