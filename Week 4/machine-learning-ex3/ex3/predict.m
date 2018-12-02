function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);
X = [ones(m, 1) X];

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%size(Theta1)
%size(Theta2)
%size(X)
%originally I fogot to the sigmoid, you need those in the hidden layer
%in the output layer you don't necessarily need sigmoid since you are
%getting the max of the index

a1 = sigmoid(X*Theta1');
%size(a1)
a1 = [ones(m,1) a1];
[M, p] = max(a1*Theta2', [], 2);
%size(p)







% =========================================================================


end