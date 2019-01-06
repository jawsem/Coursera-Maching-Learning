function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


d = 10^6; %set d = some large number

for i = 1:size(X,1); %loop through all examples
	for j=1:K;	% for each example loop through K centroids
		d_loop = sum((X(i,:)-centroids(j,:)).^2); %get the distance for a single centroid
		if d_loop < d;	%if the distance is less than the previous distance set d = d_loop
			d = d_loop;
			idx_loop = j; %set index to the lowest val
		end;
	end;
	idx(i) = idx_loop;
	d = 10^6; %reset d to high value again
end;





% =============================================================

end

