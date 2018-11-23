function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
	
%First way is to each variable by itself.  This doesn't take as advantage of vector operations
%d/d-theta for each theta noted by theta_j_change below
	%theta_1_change = (1/m)*alpha*sum((X*theta)-y);
	%theta_2_change = (1/m)*alpha*sum(((X*theta)-y).*(X(:,2)));
%Need to update simultaneously so we are not mixing the thetas
	%theta(1,1) = theta(1,1) - theta_1_change;
	%theta(2,1) = theta(2,1) - theta_2_change;

	%A better way is to Transposte X creating a 2 by 97 matrix where the first row is all ones and the second row is the features
	%Doing this we can actually complete the update in 1 line of code
	
	theta = theta - (1/m)*alpha*(X')*(X*theta - y)





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
