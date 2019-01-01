function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%

%1 way to do it


sim = exp(-(sum((x1-x2).^2))/(2*sigma^2)); %Takes 18.0625 seconds to train the large model

%Another way to do it that results in same solution. Tested both ways the first performs faster.

%sim = exp(-((x1-x2)'*(x1-x2))/(2*sigma^2)); %Takes 27.468750 seconds to train the model





% =============================================================
    
end
