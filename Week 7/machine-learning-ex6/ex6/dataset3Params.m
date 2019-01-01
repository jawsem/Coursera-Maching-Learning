function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%setting our test_vals
test_vals = [0.01 0.03 0.1 0.3 1 3 10 30]

%setting error
%use some large number
error = 1


% for i = 1:length(test_vals);
	% for j = 1:length(test_vals);
		% C_test = test_vals(i)
		% sigma_test = test_vals(j)
		% model= svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test)); 
		% predictions = svmPredict(model, Xval);
		% error_test = mean(double(predictions ~= yval));
		% if error_test < error;
			% error = error_test;
			% C = C_test;
			% sigma = sigma_test;
		% end;
	% end;
% end;
%After running the model with the test_vals above we end up with the below

C = 1
sigma = 0.1
error = 0.03




% =========================================================================

end
