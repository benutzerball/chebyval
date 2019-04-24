function y = chebyval(p, x)
% CHEBYVAL Evaluate Chebyshev Polynomial of the First Kind
%   Y = CHEBYVAL(P, X);
%   Mimics polyval. P needs to be vector but shape does not matter.
%   X may be vector or matrix or higher dimension and Y will be ordered
%   in the same fashion as X. Uses formula p_n(x) = cos(n*acos(x)) for
%   for calculating chebyshev polynomials which to the author 
%   appears to be much more stable than using polyval.
    order = numel(p)-1;
    sizeX = size(x);
    V = zeros([order+1,sizeX]);
    for i = 1:order+1
        V(i, :) = p(end-(i-1))*reshape(cos((i-1)*acos(x)), 1, []);
    end
    y = reshape(sum(V, 1), sizeX);
end