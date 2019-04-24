function T = chebymat(n)
    % CHEBYMAT Generate matrix containing coefficients for
    % Chebyshev Polynomial of the First Kind.
    % T = CHEBYMAT(N);
    % N is the max order and must be scalar.
    % T are the coefficients with size N+1 by N+1.
    % Each row i in T, representing the chebyshev polynomial of
    % order i-1 will contain coefficients t_i as in the
    % polynomial
    % t_N*x^N + t_N-1*x^N-1 ... + t_0.
    % For the first three orders T is
    % [0 0  1;
    %  0 1  0;
    %  2 0 -1];
    T = zeros(n+1,n+1);
    T(1,:) = [zeros(1,n) 1];
    if n>0
        T(2,:) = [zeros(1,n-1) 1 0];
        for i=3:n+1
            T(i,:) = 2*circshift(T(i-1,:), [0 -1]) - T(i-2,:);
        end
    end
end