function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function
%evaluated at z
%   g = SIGMOIDGRADIENT(z) computes the gradient of the sigmoid function
%   evaluated at z. This should work regardless if z is a matrix or a
%   vector. In particular, if z is a vector or matrix, you should return
%   the gradient for each element.

g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the gradient of the sigmoid function evaluated at
%               each value of z (z can be a matrix, vector or scalar).



%e = 0.01;
%p = 1/(2*e);
%t1 = z + e;
%t2 = z - e;
%g = p*(sigmoid(t1) - sigmoid(t2));
g = sigmoid(z).*(1-sigmoid(z));











% =============================================================




end
