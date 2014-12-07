function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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
cv = zeros(8,1);
sv = zeros(8,1);
cv(1) = 0.3;
sv(1) = 0.1;
for i=2 : 8
	cv(i) = cv(i-1)*3;
	sv(i) = sv(i-1)*3;
end

%cv
%sv

minerr = 1;
for i=1:8
	for j=1:8
	        model = svmTrain(X,y,cv(j), @(x1, x2) gaussianKernel(x1, x2, sv(i)));
		predictions = svmPredict(model, Xval);
		err = mean(double(predictions ~=yval));
		%err
		%minerr
		if(err < minerr)
			minerr = err;
			C = cv(j);
			sigma = sv(i);
			%C
			%sigma
		endif
	end
end

C
sigma

% =========================================================================

end
