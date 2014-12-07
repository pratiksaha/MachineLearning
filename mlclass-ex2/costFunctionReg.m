function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

temp = sigmoid(X * theta);
J = ((-1/m)*(((log(temp))'*y)+(((log(1 - temp))'*(1-y)))));
regcost = 0;
for i=2:length(theta)
	regcost = regcost + (theta(i,1)*theta(i,1));
endfor
J = J + (lambda/(2*m))*regcost;
th = theta;
th(1,1) = 0;
grad1= (1/m)*(X' *(temp - y));
grad2 = (1/m)*(X' *(temp - y))+ (lambda/m)*th;
grad = grad2;
grad(1,1) = grad1(1,1);


% =============================================================

end
